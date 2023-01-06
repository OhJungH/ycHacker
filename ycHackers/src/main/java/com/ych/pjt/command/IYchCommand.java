package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface IYchCommand {

	public void execute(HttpServletRequest req, Model model);
}
