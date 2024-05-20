<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="postModal" class="modal fade" role="dialog" data-userno="${UserInfo.userNo}" data-agId="${UserInfo.agId}">
    <div class="modal-dialog">
        <!-- 모달 내용 -->
        <div class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h4 class="modal-title">피드 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <input type="hidden" id="feedUpdateNo" name="feedUpdateNo">
            <input type="hidden" id="feedAgId" name="feedAgId">
            <!-- 모달 바디 -->
            <div class="modal-body">
                <!-- 포스트 내용 입력 폼 -->
                <div class="form-group">
                    <label for="postContent">내용</label>
                    <textarea class="form-control" id="postContent1" name="postContent" rows="4" cols="50"></textarea>
                </div>
                
                <!-- 파일 업로드 -->
                <div id="mediaContainer"></div>
                <div class="form-group">
                    <label for="imageInput">이미지 또는 비디오 업로드</label>
                    <input type="file" class="form-control-file" id="imageInput1">
                </div>
                
                <!-- 멤버십 전용 포스트 체크박스 -->
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="membershipPost1">
                    <label class="form-check-label" for="membershipPost">멤버십 전용 포스트</label>
                </div>
                
                <!-- 미디어 컨테이너 -->
            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <!-- 포스트 버튼 -->
                <button type="button" id="feedUpdateBtn" class="btn btn-primary">포스트</button>
                <!-- 모달 닫기 버튼 -->
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
