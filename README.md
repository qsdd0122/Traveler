# Traveler (참여인원 3명)
# Spring framework 이용한 여행 플래너 웹 애플리케이션

● 스프링 레거시 프로젝트로 작성

● 스프링 MVC 기반으로 CRUD 구현

● Oracle DB를 사용하였으며 MyBatis로 매핑

● 웹 어플리케이션을 구동하기 위한 WAS로 Apache Tomcat을 선택

● JSP로 View 구성, Ajax로 데이터 통신


## 시스템 구현 내용

## - 메인 페이지

![image](https://user-images.githubusercontent.com/96825988/147810801-abdeed53-2a06-4d2c-80b3-24ab2b347208.png)


## - 최적 경로 (참여도 20%)


 최적경로 기능은 사용자가 하루에 3곳을 방문하기 위한 여행지를 정하고 계획을 짰을 때, 어떤 동선 으로 가야 가성비가 좋고 빠르게 갈 수 있을지 제공 해준다. 그래서 사진을 보듯이 출발지에서 목적지 까지 지도에 빨간색 동선을 통해 최적 경로 표시하며, 최적거리와 최적시간 또한 제공해준다. 그리고 사진을 보듯이 지도 옆에 있는 사용자가 정한 여행지 지역들이 있는데 이동할 수 있는 리스트 뷰를 통해 출발지와 도착지를 사용자가 설정이 가능하다.


![image](https://user-images.githubusercontent.com/96825988/147810825-6aac4b06-9454-4a3d-80a6-6a50c24c81bb.png)



## - 동행 시스템 (참여도 80%)


![image](https://user-images.githubusercontent.com/96825988/147810927-9ed66f72-9fc0-45b3-a6f5-e9338d7c3da7.png)

현재 모집 진행 중인 동행 게시글을 Traveler 사용자에게 보여준다.

![image](https://user-images.githubusercontent.com/96825988/147811862-cc09769c-7f87-4816-a379-a20aef2b6072.png)

자신의 여행플랜을 선택해 동행 모집을 할 수 있고 자신의 여행지와 비슷한 다른 사용자의 플랜을 보여주어 동행신청을 할 수도 있다.

![image](https://user-images.githubusercontent.com/96825988/147810931-7e192421-8fd6-4b24-bd54-c8d27af67f52.png)

![image](https://user-images.githubusercontent.com/96825988/147810936-efb2318b-34f9-4963-9ff4-68326e880f4d.png)

동행 신청을 해서 메세지를 적어 보내면 해당 플랜 사용자에게 쪽지가 전송되어 수락하면 동행 일원이 된다.

![image](https://user-images.githubusercontent.com/96825988/147810942-f0ccd7eb-83c3-4462-ad55-1dcf9156ce5e.png)

같은 동행원들끼리 실시간 채팅으로 이야기를 나눌 수 있다. (Firebase RealTime 데이터베이스 사용)


## - 예산 시스템 (참여도 0%)


![image](https://user-images.githubusercontent.com/96825988/147811016-66469178-2cc3-4bbc-80f3-59e3e95d4ca8.png)

![image](https://user-images.githubusercontent.com/96825988/147811029-9b17c3d5-66b0-46e1-8d6a-fa07832d7066.png)

예산 생성을 할 수 있으며, 주제 입력, 수입/지출 정보, 날짜 관광, 숙박, 식비 등 금액을 입력하여 새로운 예산을 추가할 수 있다.

![image](https://user-images.githubusercontent.com/96825988/147811048-918573c7-fa81-4a4b-bc8d-4ee6d6771b71.png)

해당 일차에 대한 공개된 예산 추이를 시각적인 자료(그래프, 도표)를 통해 사용자에게 보여주도록 제공한다. 

![image](https://user-images.githubusercontent.com/96825988/147811054-c9781651-f4fa-4586-bf46-9f8943cc8bb6.png)

사용자에게 효율적인 여행 예산을 추천해준다.
