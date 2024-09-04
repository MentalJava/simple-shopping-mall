# Simple Shopping Mall
<div align=center>

![shoppingcart-removebg-preview](https://github.com/user-attachments/assets/9e57ba48-0877-4a7e-a66a-d4b827c25deb)


</div>


## 프로젝트 정보
 - flutter 공부를 위한 두번째 프로젝트 입니다.
 - 간단한 쇼핑몰 UI와 기능을 구현한 어플입니다.
 - 개발기간 2024/07/22 ~ 8/30 (완)

## 프로젝트 소개
 - 첫번째 프로젝트인 Hotel Reservation 에서 사용한 여러 위젯들을 사용해서 UI 구현 했습니다.
 - Firestore Database, Storage, Model 을 사용해서 앱 전반적인 DB 관리를 수월하게 진행 하였습니다.
 - GetX 를 사용해서 상태관리 부분을 더 심도있게 다뤘습니다.

## 화면 구성
<details>
 <summary>접기/펼치기</summary><br>

|Sign in|Home(noItems)|
|:--:|:--:|
![login-screen](https://github.com/user-attachments/assets/aae4b3fd-38c8-4df3-8461-0b225a2e3eb5)|![home(no-items)](https://github.com/user-attachments/assets/2c7cd9aa-6e1a-4a34-ae1d-ac84dbe86ff7)
|Home(asc)|Home(desc)|
![home(items)](https://github.com/user-attachments/assets/ff26483a-b7ab-43cc-8a8a-a49d7255fbec)|![home(items-desc)](https://github.com/user-attachments/assets/b922cd8a-a696-46cf-bf85-0ba287a28de1)
|Detail|Modified|
![home-detail](https://github.com/user-attachments/assets/563fd767-127d-4129-a131-981bf3df0353)|![home-detail-edit](https://github.com/user-attachments/assets/2922df39-57fb-47df-89f6-ca63a32d876c)
|ThumbsUp(ClickEvent 1)|ThumbsUp(ClickEvent 2)|
![home-detail(ThumbsUp)](https://github.com/user-attachments/assets/ce70cf5b-7c5e-45bf-b23c-3f6bd3c5803e)|![home-detail(ThumbsUp2)](https://github.com/user-attachments/assets/c0ddd953-c46d-4806-923b-eed1d0fda260)
|Profile(google)|Profile(Anonymous)|
![home-profile(google)](https://github.com/user-attachments/assets/70b7d7ee-bb65-4bb1-9d99-fba4a7e8921f)|![home-profile(anonymous)](https://github.com/user-attachments/assets/b1ae4c44-3b9c-4f34-9d01-15fde5f18006)

</details>

## 프로젝트 기능 정리
- Firebase Authentication 을 사용해서 Google, Anonymous Login 구현 완료
- Firestore Database, Storage (Documents DB NoSQL) 를 사용해서 Items Data를 생성, 수정, 가져오기, 삭제 (CRUD) 등 전반적인 DB 작업 완료
- 여러 데이터를 가져올 때 원하는 기준으로 데이터 목록을 받아 올 수 있습니다.
  1. Home Item을 가져올 때 Price를 기준으로 ascending, descending 구현 완료
  2. ThumbsUp button 을 누를 때 현재 사용자가 데이터에 담겨 있으면 중복 클릭 X
- Obx, Getbuilder 를 사용해 데이터가 바뀔 때 마다 update 되도록 반응형 상태관리 구현
- 현재 사용자에 맞게 Profile 정보 변경 (Google, Anonymous)
- ImagePicker를 사용해 카메라 및 앨범에서 원하는 이미지 가져오기

## 기술 스택
### Environment
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-007ACC?style=for-the-badge&logo=Visual%20Studio%20Code&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white)
![Github](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white)

### Development
![Flutter](https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

### Communication
![Notion](https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white)

## 프로젝트 리뷰
두번째로 진행하게 된 프로젝트지만 더 심도있게 다룰려고 하다보니 많은 고비들이 스쳐 지나갔다. (코로나 이슈도 포함) <br>
Getx의 활용도 면에서도 부족한 점이 많이 느껴졌고, DB 부분들을 직접 다루게 되면서 훨씬 복잡하고 어려워지고 아직 배워야 <br>
할 부분이 많다는 점에서 다시 불타올랐다 ! 이제 새발의 피를 경험하게 된거같고 앞으로도 부딪히는 부분들이 많이 생기겠지만 <br>
배운것들을 톡톡히 활용해서 발전하는 개발자로 거듭나야겠다.

**특히 아쉬웠던 부분**
1. Custom Widget 에서 Controller 를 직접 Get.put 후 사용 ( 의존성이 생겨버려서 다시 코드리뷰 후 수정) 
2. Stack 을 사용하면서 Loading indicator 구현하는 도중 문제 발생 (Stack 의 이해도 부족)
3. Streambuilder, Futurebuilder 를 대체해서 Getbuilder, Obx 사용 가능한데 코드를 더 복잡하게 구현
4. git 사용하면서 원격, 로컬 branch 충돌 전체적으로 꼬이는 문제 발생 commit 부터 원래 작성중이던 코드들도 다시 작업
5. Obx overflow 오류 , Getbuilder 이해도 부족으로 인한 상태관리 미흡
6. 처음 사용해보는 코드들로 인해 전체적으로 매끄럽게 다듬어지지 못한 부분들

다음 프로젝트 들어가기전에 미흡했던 부분들 다시 체크해서 공부 후 더 좋은 방향으로 갈 수 있도록 노력해야겠다.

🦊
