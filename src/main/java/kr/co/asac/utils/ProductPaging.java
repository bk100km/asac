package kr.co.asac.utils;

public class ProductPaging {

	private int listSize = 10; // �ʱⰪ���� ��ϰ����� 10���� ���� �� �������� ������ ����Ʈ�� ����

	private int rangeSize = 5; // �ʱⰪ���� ������������ 5�� ���� �� ������ ������ ������ �������� ����

	private int page; // �������� ������ ��ȣ

	private int range; // �� ������ ���� ���� ��ȣ

	private int listCnt; // ��ü ���ù��� ����

	private int pageCnt; // ��ü ������ ������ ����

	private int startPage; // �� ������ ���� ���� ��ȣ

	private int startList; // �Խ��� ���۹�ȣ

	private int endPage; // �� ������ ���� �� ��ȣ

	private boolean prev; // ���� ������

	private boolean next; // ���� ������
    	
	public int getRangeSize() {

		return rangeSize;

	}

	public int getPage() {

		return page;

	}

	public void setPage(int page) {

		this.page = page;

	}

	public int getRange() {

		return range;

	}

	public void setRange(int range) {

		this.range = range;

	}

	public int getStartPage() {

		return startPage;

	}

	public void setStartPage(int startPage) {

		this.startPage = startPage;

	}

	public int getEndPage() {

		return endPage;

	}

	public void setEndPage(int endPage) {

		this.endPage = endPage;

	}

	public boolean isPrev() {

		return prev;

	}

	public void setPrev(boolean prev) {

		this.prev = prev;

	}

	public boolean isNext() {

		return next;

	}

	public void setNext(boolean next) {

		this.next = next;

	}

	public int getListSize() {

		return listSize;

	}

	public void setListSize(int listSize) {

		this.listSize = listSize;

	}

	public int getListCnt() {

		return listCnt;

	}

	public void setListCnt(int listCnt) {

		this.listCnt = listCnt;

	}

	public int getStartList() {

		return startList;

	}

	// ù��° ���� page �� ���� ������ ����, �ι�° ���� range �� ���� ������ ���� ����, ����° ���� listCnt�� �Խù��� �� ����
	public void pageInfo(int page, int range, int listCnt) {

		this.page = page;

		this.range = range;

		this.listCnt = listCnt;

		// ��ü ��������
		this.pageCnt = (int) Math.ceil((double) listCnt / listSize);

		// ���� ������
		this.startPage = (range - 1) * rangeSize + 1;

		// �� ������
		this.endPage = range * rangeSize;

		// �Խ��� ���۹�ȣ
		this.startList = (page - 1) * listSize;

		// ���� ��ư ����
		this.prev = range == 1 ? false : true;

		// ���� ��ư ����
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
}