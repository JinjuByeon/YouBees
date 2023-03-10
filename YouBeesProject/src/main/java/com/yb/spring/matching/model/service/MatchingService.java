package com.yb.spring.matching.model.service;

import java.util.ArrayList;

import com.yb.spring.common.model.vo.PageInfo;
import com.yb.spring.matching.model.vo.Dibs;
import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.matching.model.vo.ProfileFiles;
import com.yb.spring.matching.model.vo.Review;
import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Freelancer;
import com.yb.spring.member.model.vo.Location;

public interface MatchingService {
	
	// 서비스 카테고리 리스트
	ArrayList<Categories> selectServiceList(int sNum);
	
	// 서비스별 프리랜서 리스트 (정렬해서 가져오기)
	ArrayList<FreelancerProfile> selectFreelancerList(Freelancer f, PageInfo pi);
	
	// 서비스별 프리랜서 리스트 개수 가져오기
	int selectFreelancerListCount(Freelancer f);
	
	// 찜하기
	int insertDib(Dibs d);
	int selectDib(Dibs d);
	int updateDibN(Dibs d);
	int updateDibY(Dibs d);
	
	// 찜목록 가져오기
	ArrayList<Dibs> selectDibsList(int cusNum);
	
	// 프리랜서 검색하기
	
	
	// 지역 목록 가져오기
	ArrayList<Location> selectLocationList();
	ArrayList<Location> selectCityList();
	
	// 프리랜서 프로필 정보 가져오기
	FreelancerProfile selectFreelancerDetail(Freelancer f);
	ProfileFiles selectFiles(int freeNum);
	
	// 프리랜서의 매칭횟수 가져오기
	int selectAcceptCnt(int freeNum);

	// 자격정보 파일 리스트
	int insertFiles(ProfileFiles f);
	
	// 별점 평균
	float selectAvgStar(int freeNum);
	
	// 리뷰 리스트 가져오기
	ArrayList<Review> selectReviewList(int freeNum);
	
	// 리뷰 등록하기
	int insertReview(Review r);
	
	// 프리랜서 끌고오기(메인페이지)
	ArrayList<FreelancerProfile> selectTopFreeList();
	
	// 매칭 여부
	String accept(Freelancer f);
}
