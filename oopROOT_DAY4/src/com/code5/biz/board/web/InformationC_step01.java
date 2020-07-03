package com.code5.biz.board.web;

import com.code5.fw.web.Box;

/**
 * @author seuk
 *
 */
public class InformationC_step01 {

	/**
	 * @return
	 */
	private void start() {
		Box box = Box.getThread();
		box.put("NAME", "InformationC");
	}

	/**
	 * @param request
	 * @return
	 */
	public String infoListContents() {

		start();

		// infoListContents ����

		return "/biz/board/listContents.jsp";
	}

	/**
	 * @return
	 */
	public String infoLoadContent() {

		start();

		// infoLoadContent ����

		return "/biz/board/loadContent.jsp";
	}

}
