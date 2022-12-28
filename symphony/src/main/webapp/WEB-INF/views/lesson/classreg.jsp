<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="../css/classreg.css" rel="stylesheet" media="all">

    <div class="page-wrapper bg-gra-02 p-t-130 font-poppins">
        <div class="wrapper wrapper--w1200">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">강사등록</h2>
                    <form name="frm" method="POST" action="lessoncreate.do" enctype="multipart/form-data">
 
 <!--------- --------------------------------질문지 시작------------------------------------------------ -->

                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">강의 제목을 입력해 주세요!</label>
                                    <input class="input--style-4" type="text" name="c_title" size=37>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">프로필 사진 업로드</label>
                                    <input class="input--style-4" type="file" name="prof_photoMF" size='50'>
                                </div>
                            </div>
                      
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">어떤 강의인지 설명해주세요</label>
                                    <input class="input--style-4" type="text" name="c_content" size=180>
                                </div>
                            </div>
                            <br>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">강의 악기를 선택해주세요</label>
                                    <div class="p-t-10">
                                        <label class="radio-container">클래식피아노
                                            <input type="radio" name="q01ans" value="classic_p">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">재즈피아노
                                            <input type="radio" name="q01ans" value="jazz_p">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">팝&뉴에이지 피아노
                                            <input type="radio" name="q01ans" value="pop_p">
                                            <span class="checkmark"></span>
                                        </label>
                                        <br>
                                        <label class="radio-container">통기타
                                            <input type="radio" name="q01ans" value="acou_g">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">일렉기타
                                            <input type="radio" name="q01ans" value="elec_g">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">베이스기타
                                            <input type="radio" name="q01ans" value="bass_g">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">바이올린
                                            <input type="radio" name="q01ans" value="vio">
                                            <span class="checkmark"></span>
                                        </label>
                                </div>
                             </div>   
                                <br>
                                <br>
                                <br>
                          
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">강의 방식을 선택해주세요</label>
                                    <div class="p-t-10">
                                        <label class="radio-container">강사님이 수강생에게 방문
                                            <input type="radio" checked="checked" name="q03ans" value="ttos">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">수강생이 강사님에게 방문
                                            <input type="radio" name="q03ans" value="stot">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">실시간 온라인 화상수업
                                            <input type="radio" name="q03ans" value="online">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">어느 지역에서 강의를 진행하실 예정인가요?</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">서울특별시
                                            <input type="radio" checked="checked" name="q04ans" value="seoul">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">경기도
                                            <input type="radio" name="q04ans" value="gg">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">인천
                                            <input type="radio" name="q04ans" value="in">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">상관없음(온라인수업 진행 시)
                                            <input type="radio" name="q04ans" value="dontcare">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <br>
                       
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">강의 가능 시간을 선택해주세요(복수선택가능)</label>
                                    <div class="p-t-10">
                                        <label class="radio-container"> 9:00-10:00
                                            <input type="checkbox" name="c_time" value="9">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 10:00-11:00
                                            <input type="checkbox" name="c_time" value="10">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 11:00-12:00
                                            <input type="checkbox" name="c_time" value="11">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 12:00-13:00
                                            <input type="checkbox" name="c_time" value="12">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 13:00-14:00
                                            <input type="checkbox" name="c_time" value="13">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 14:00-15:00
                                            <input type="checkbox" name="c_time" value="14">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 15:00-16:00
                                            <input type="checkbox" name="c_time" value="15">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 16:00-17:00
                                            <input type="checkbox" name="c_time" value="16">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 17:00-18:00
                                            <input type="checkbox" name="c_time" value="17">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">강의 가능 요일을 선택해주세요(복수선택가능)</label>
                                    <div class="p-t-10">
                                        <label class="radio-container"> 월요일
                                            <input type="checkbox" name="c_date" value="mon">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 화요일
                                            <input type="checkbox" name="c_date" value="tue">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 수요일
                                            <input type="checkbox" name="c_date" value="wed">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 목요일
                                            <input type="checkbox" name="c_date" value="thu">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 금요일
                                            <input type="checkbox" name="c_date" value="fri">
                                            <span class="checkmark"></span>
                                        </label><br>
                                        <label class="radio-container"> 토요일
                                            <input type="checkbox" name="c_date" value="sat">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container"> 일요일
                                            <input type="checkbox" name="c_date" value="sun">
                                            <span class="checkmark"></span>
                                        </label>
                                </div>
                            </div>
                            <br>
                       
         
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">시간당 수강료를 적어주세요</label>
                                    <input class="input--style-4" type="text" name="price" placeholder="원 단위로 입력해주세요">
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">등록하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<div class="p-b-100 font-poppins">
</div>

<%@ include file="../footer.jsp"%>