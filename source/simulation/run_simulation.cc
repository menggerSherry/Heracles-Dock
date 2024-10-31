#include <iostream>
#include <cstring>
#include <unistd.h>
#include <vector>
#include "complex.h"
#include <fstream>
#include "read_input_structure.h"
#include "initialization.h"
#include "translate.h"
#include "config_args.h"
#include "cal_anm.h"
#include "anm.h"
#include "lib_tools.h"
#include "swarm_centers.h"
#include "prepare_gso_tasks.h"
#include "fastdfire.h"
using namespace std;

int main(int argc, char ** argv){
    int ch;
    string file_;
    int step;
    int list;
    while((ch = getopt(argc,argv,"f:s:l:")) != -1){
        if (ch == 'f')
        {
            file_ = (string) optarg;
            // std::cout<<file_<<std::endl;
            // break;
        } else  if(ch == 's'){
            step = atoi (optarg);
            // std::cout<<(string)optarg<<std::endl;
            // break;

        } else if(ch == 'l'){
            list = atoi(optarg);
            // break;
        }
        
    }
    

    ConfigArgs args;
    // get setup from json
    get_setup(args, file_);

    int str_size = file_.size();
    Complex receptor;
    read_input_structure(receptor,args.receptor_pdb.c_str(), args.noxt,args.noh,args.now,args.verbose_parser,str_size);
    Complex ligand;
    read_input_structure(ligand,args.ligand_pdb.c_str(), args.noxt,args.noh,args.now,args.verbose_parser,str_size);

    // initialization
    init_center_translate(receptor.translation,receptor.atom_coordinates,receptor.elements,receptor.structure_size,receptor.num_atoms,receptor.num_structures);
    init_center_translate(ligand.translation,ligand.atom_coordinates,ligand.elements,ligand.structure_size,ligand.num_atoms,ligand.num_structures);
    
    // calcularte surface points
    SwarmCenters centers;
    calculate_start_pos(
        centers,
        receptor,ligand,args.swarms,args.glowworms,args.starting_points_seed,
        receptor.translation, ligand.translation, args.surface_density,
        args.use_anm, args.anm_seed, args.anm_rec, args.anm_lig, 
        args.membrane, args.transmembrane, args.write_starting_positions,
        args.swarm_radius, args.flip, args.fixed_distance, args.swarms_per_restraint,
        args.dense_sampling,args.receptor_pdb.c_str()
    );

    // translate importance: after translate the coord has changed
    translate(receptor.atom_coordinates,receptor.translation,receptor.structure_size,receptor.num_atoms,receptor.num_structures);
    translate(ligand.atom_coordinates,ligand.translation,ligand.structure_size,ligand.num_atoms,ligand.num_structures);

    // get the mask
    get_nm_mask(receptor.mask,receptor.residue_name,receptor.STANDARD_TYPES,receptor.MODIFIED_TYPES,receptor.DNA_STANDARD_TYPES,receptor.RNA_STANDARD_TYPES,receptor.residue_atom_number,receptor.residue_size);
    get_nm_mask(ligand.mask,ligand.residue_name,ligand.STANDARD_TYPES,ligand.MODIFIED_TYPES,ligand.DNA_STANDARD_TYPES,ligand.RNA_STANDARD_TYPES,ligand.residue_atom_number,ligand.residue_size);
    
    // TODO: calculate reference point 

    // calculate ANM
    ANM rec_anm;
    ANM lig_anm;
    // ANM lig_anm;
    if (args.use_anm){
        if(args.anm_rec>0){
            std::cout<<"Calculating ANM for receptor molecule..."<<std::endl;
            cal_anm(receptor,rec_anm,args.anm_rec, args.anm_rec_rmsd, args.anm_seed);
  
        }
        if(args.anm_lig>0){
            std::cout<<"Calculating ANM for ligand molecule..."<<std::endl;
            cal_anm(ligand,lig_anm,args.anm_lig,args.anm_lig_rmsd,args.anm_seed);
        }
    }
    std::cout<<"LightDock setup OK"<<std::endl;

    FastDifire score;
    prepare_gso_tasks(
        centers, receptor, ligand, score, args.anm_seed, args.translation_step, args.rotation_step, args.use_anm, args.nmodes_step,
        args.anm_rec, args.anm_lig, args.local_minimization, centers.swarms, args.glowworms
    );
    
    free_complex(receptor);
    free_complex(ligand);
    free_anm(rec_anm);
    free_anm(lig_anm);
    free_swarmcenters(centers);
    
    return 0;
}