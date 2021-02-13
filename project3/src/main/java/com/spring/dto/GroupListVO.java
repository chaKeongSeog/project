package com.spring.dto;

import java.util.List;

public class GroupListVO {
	private int gno;
    private String id;
    private String name; 
    private String goal; 
    private String code;
    private List<GroupChatVO> chat;
    private List<GroupMemberVO2> member;
    private List<GroupAttachVO> attach;
    private List<GroupBoardListVO> board;
    private List<GroupScheduleVO> schedule;
    private List<TodoListVO> todoList;
    private List<MemoVO> memo;
    private List<GroupFileVO> file;
    private int groupMemberCount;
    private int groupChatCount;
    private int groupFileCount;
    private int groupBoardCount;
    private int groupScheduleCount;
    private int groupMemoCount;
    
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<GroupChatVO> getChat() {
		return chat;
	}
	public void setChat(List<GroupChatVO> chat) {
		this.chat = chat;
	}
	public List<GroupMemberVO2> getMember() {
		return member;
	}
	public void setMember(List<GroupMemberVO2> member) {
		this.member = member;
	}
	public List<GroupAttachVO> getAttach() {
		return attach;
	}
	public void setAttach(List<GroupAttachVO> attach) {
		this.attach = attach;
	}
	public List<GroupBoardListVO> getBoard() {
		return board;
	}
	public void setBoard(List<GroupBoardListVO> board) {
		this.board = board;
	}
	public List<GroupScheduleVO> getSchedule() {
		return schedule;
	}
	public void setSchedule(List<GroupScheduleVO> schedule) {
		this.schedule = schedule;
	}
	public List<TodoListVO> getTodoList() {
		return todoList;
	}
	public void setTodoList(List<TodoListVO> todoList) {
		this.todoList = todoList;
	}
	public List<MemoVO> getMemo() {
		return memo;
	}
	public void setMemo(List<MemoVO> memo) {
		this.memo = memo;
	}
	public List<GroupFileVO> getFile() {
		return file;
	}
	public void setFile(List<GroupFileVO> file) {
		this.file = file;
	}
	public int getGroupMemberCount() {
		return groupMemberCount;
	}
	public void setGroupMemberCount(int groupMemberCount) {
		this.groupMemberCount = groupMemberCount;
	}
	public int getGroupChatCount() {
		return groupChatCount;
	}
	public void setGroupChatCount(int groupChatCount) {
		this.groupChatCount = groupChatCount;
	}
	public int getGroupFileCount() {
		return groupFileCount;
	}
	public void setGroupFileCount(int groupFileCount) {
		this.groupFileCount = groupFileCount;
	}
	public int getGroupBoardCount() {
		return groupBoardCount;
	}
	public void setGroupBoardCount(int groupBoardCount) {
		this.groupBoardCount = groupBoardCount;
	}
	public int getGroupScheduleCount() {
		return groupScheduleCount;
	}
	public void setGroupScheduleCount(int groupScheduleCount) {
		this.groupScheduleCount = groupScheduleCount;
	}
	public int getGroupMemoCount() {
		return groupMemoCount;
	}
	public void setGroupMemoCount(int groupMemoCount) {
		this.groupMemoCount = groupMemoCount;
	}
	@Override
	public String toString() {
		return "GroupListVO [gno=" + gno + ", id=" + id + ", name=" + name + ", goal=" + goal + ", code=" + code
				+ ", chat=" + chat + ", member=" + member + ", attach=" + attach + ", board=" + board + ", schedule="
				+ schedule + ", todoList=" + todoList + ", memo=" + memo + ", file=" + file + ", groupMemberCount="
				+ groupMemberCount + ", groupChatCount=" + groupChatCount + ", groupFileCount=" + groupFileCount
				+ ", groupBoardCount=" + groupBoardCount + ", groupScheduleCount=" + groupScheduleCount
				+ ", groupMemoCount=" + groupMemoCount + "]";
	}
	public GroupListVO(int gno, String id, String name, String goal, String code, List<GroupChatVO> chat,
			List<GroupMemberVO2> member, List<GroupAttachVO> attach, List<GroupBoardListVO> board,
			List<GroupScheduleVO> schedule, List<TodoListVO> todoList, List<MemoVO> memo, List<GroupFileVO> file,
			int groupMemberCount, int groupChatCount, int groupFileCount, int groupBoardCount, int groupScheduleCount,
			int groupMemoCount) {
		super();
		this.gno = gno;
		this.id = id;
		this.name = name;
		this.goal = goal;
		this.code = code;
		this.chat = chat;
		this.member = member;
		this.attach = attach;
		this.board = board;
		this.schedule = schedule;
		this.todoList = todoList;
		this.memo = memo;
		this.file = file;
		this.groupMemberCount = groupMemberCount;
		this.groupChatCount = groupChatCount;
		this.groupFileCount = groupFileCount;
		this.groupBoardCount = groupBoardCount;
		this.groupScheduleCount = groupScheduleCount;
		this.groupMemoCount = groupMemoCount;
	}
	public GroupListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
    
	

}
