#include<iostream> 
#include<list>
#include <chrono>
#include <random>
#include <fstream>
#include <iomanip>
#include"kmeans.h"
#include "simple_svg.hpp"
#include <map>
#include <stdio.h>
#include "string.h"
#include <vector>
#include "simple_svg.hpp"
// 初始化聚类中心
/*
    double center: 初始化聚类中心 k*2
    dobule point: initial points
    int point_number: point number
    int K: center number

*/
void kmeans_init_centers(double * center, double * point,int point_number , int K){
    std::random_device rd;  //Will be used to obtain a seed for the random number engine
	std::mt19937 gen(rd()); //Standard mersenne_twister_engine seeded with rd()
	std::uniform_int_distribution<int> distribution(0, point_number - 1);
    // 获得随机位置
	int id = distribution(gen);
    // 得到第一个聚类点
    for(int i = 0; i< K; i++){
        center[i*2] = point[id*2];
        center[i*2+1] = point[id*2+1];

    }
    // std::cout<<111<<std::endl;
    // 存放每个点到中心的最短距离
    double * floatIt  = new double [point_number];
    double sum, min_distance;
    // 初始化center
    // 从第二个点开始初始化
    for(int k = 1; k < K; k++){
        sum = 0; 
        // double * floatIt = &nearestDis[0];
        for(int p = 0; p<point_number; p++){
            // nearest center
            double * current_point = &point[p*2];
            min_distance = std::numeric_limits<double>::max();

            int k_id = -1;
            double dis;
            // 对已经确定的中心点遍历每一个点，得到聚类中心点距离
            for(int t = 0; t<k; t++){
                double * current_center = &center[t*2];
                dis = sqrt((current_point[0] - current_center[0])*(current_point[0] - current_center[0]) + (current_point[1] - current_center[1])*(current_point[1] - current_center[1]));
                // calc distance
                if(dis<min_distance){
                    min_distance = dis;
			        k_id = t;
                }

            }
            sum+=min_distance;
            floatIt[p] = min_distance;
        }
        // 得到总和和每一个点的距离已经确定的中心点的最小距离。
        std::random_device rd;  //Will be used to obtain a seed for the random number engine
		std::mt19937 gen(rd()); //Standard mersenne_twister_engine seeded with rd()
		std::uniform_real_distribution<float> distribution(0.0, 1.0);
        double probability = distribution(gen);
        sum = sum*probability;
        for(int p = 0; p<point_number; p++){
            sum = sum - floatIt[p];
            if(sum>0) continue;
            center[k*2] = point[p*2];
            center[k*2+1] = point[p*2+1];
            break;
        }
        
    }
    delete [] floatIt;
}


inline double Distance(double * p1, double * p2)
{
	return sqrt((p1[0] - p2[0])*(p1[0] - p2[0]) + (p1[1] - p2[1])*(p1[1] - p2[1]));
}

void run_kmeans(int * group, double * points,double * centers, int max_iter, int point_number , int K){
    double * old_center = new double[K*2];
    for(int iter = 0; iter<max_iter; iter++){
        memcpy(old_center, centers, sizeof(double)*K*2);
        for(int i = 0; i<point_number; i++){
            double * current_point = & points[i*2];
            double minDistance = std::numeric_limits<float>::max();
            int k_id = -1;
            double dis;
            for(int k = 0; k<K; k++){
                double * current_center = &centers[k*2];
                dis = Distance(current_center, current_point);
                if(dis<minDistance){
                    minDistance = dis;
                    k_id = k;
                }
            }
            group[i] = k_id;

        }
        double * new_center = new double[K*2];
        int * count = new int[K];
        memset(new_center, 0.0, sizeof(double)*K*2);
        memset(count,0,sizeof(int)*K);
        for(int p = 0; p<point_number; p++){
            // 计算每个组的距离总和与元素总和
            int current_group = group[p];
            new_center[current_group*2] += points[p*2]; 
            new_center[current_group*2+1] += points[p*2+1]; 
            count[current_group]++;
        }
        for(int i = 0; i<K;i++){
            // 得到中心的平均值
            centers[i*2] = new_center[i*2] / (1.0*count[i]);
            centers[i*2+1] = new_center[i*2+1] / (1.0*count[i]);
        }

        double sum = 0;
        for(int k = 0; k<K; k++){
            sum += Distance(&centers[k*2], &old_center[k*2]);
        }
        std::cout << "iteration "<< iter<<" sum " << sum << std::endl;
        delete [] new_center;
        delete [] count;
		
        
    }
    delete [] old_center;

}
void init_points(std::vector<double>& points, std::string fileName){
    std::ifstream fs;
	fs.open(fileName.c_str(), std::ofstream::in);
	if (fs.is_open())
	{
		double x, y;
        int iter = 0;
		while (!fs.eof())
		{
			fs >> x >> y;
            points.push_back(x);
            points.push_back(y);
            // points[iter*2] = x;
            // points[iter*2+1] = y;
            // iter++;
			// _Points.push_back(Point(x, y));
		}
		// _PointNumber = _Points.size();
		fs.close();
	}
	else
	{
		std::cout << fileName.c_str() << " error opening file\n";
	}

}

void SaveSVG(std::string fileName ,double * points, double * center, int * group, int point_number, int K)
{
	int W = 1000;
	int H = 1000;
	svg::Dimensions dimensions(W, H);
	svg::Document doc(fileName.c_str(), svg::Layout(dimensions, svg::Layout::BottomLeft));

	svg::Color pointColor(svg::Color::Red);
	svg::Color centerColor(svg::Color::Green);
	float min_x, max_x, min_y, max_y, scale, cx, cy;
	float *colors = new float[K * 3];

	for (int i = 0; i < K; i++)
	{
		colors[3 * i + 0] = (3 * (i + 1) % 11) / 11.;
		colors[3 * i + 1] = (7 * i % 11) / 11.;
		colors[3 * i + 2] = (9 * i % 11) / 11.;
	}
	max_x = max_y = -(min_x = min_y = HUGE_VAL);
	// std::list<Point>::iterator pointsIter = _Points.begin();
	for (int j = 0; j < point_number; j++)
	{
        double * current_point = &points[j*2];
		if (max_x < current_point[0]) max_x = current_point[0];
		if (min_x > current_point[0]) min_x = current_point[0];
		if (max_y < current_point[1]) max_y = current_point[1];
		if (min_y > current_point[1]) min_y = current_point[1];
	}
	scale = W / (max_x - min_x);
	if (scale > H / (max_y - min_y))
		scale = H / (max_y - min_y);
	cx = (max_x + min_x) / 2.0;
	cy = (max_y + min_y) / 2.0;
	
	
	// std::list<Point>::iterator centerIter = _Centers.begin();
	for (int k = 0; k < K; k++)
	{
		int r = colors[3 * k]*255;
		int g = colors[3 * k + 1] * 255;
		int b = colors[3 * k + 2] * 255;
		svg::Color c(r, g, b);
		double * current_center = &center[k*2];
		// pointsIter = _Points.begin();
		for (int j = 0; j < point_number; j++)
		{
            int current_group = group[j];
            double * current_point =  &points[j*2];
			if (current_group != k)
				continue;
			doc << svg::Circle(svg::Point((current_point[0] - cx) * scale + W / 2, (current_point[1] - cy) * scale + H / 2), 1, svg::Fill(svg::Color::White), svg::Stroke(1, c));

		}
		doc << svg::Rectangle(svg::Point((current_center[0] - cx) * scale + W / 2, (current_center[1] - cy) * scale + H / 2), 5,5, svg::Fill(svg::Color::White), svg::Stroke(2, c));
	}

	delete colors;

	doc.save();
}

int main(){
    int N;
    std::vector<double> points;
    init_points(points,"S1.txt");
    int K = 15;
    double * center = new double[K*2];
    
    int point_num = int(points.size()/2);
    int * group = new int[point_num];
    
    kmeans_init_centers(center,&points[0],point_num,K);
    
    run_kmeans(group,&points[0],center,100,point_num,K);

    SaveSVG("test.svg", &points[0], center, group, point_num, K);
    // std::cout<<points[4999*2]<<" "<<points[4999*2+1]<<std::endl;
    return 0;
}


