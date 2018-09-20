#! /usr/bin/env python3

"""
---------------------------------------------------------------------------------------------
# File    : shell
# Author  : Neo.H
# Date    : Sep 19, 2018
# Version : v1.00
---------------------------------------------------------------------------------------------
This is a python module to ease the shell command executions. In this file, common actions
will be provided according to the coding style of the developer.
---------------------------------------------------------------------------------------------
Two usage of this class supported:
	-- one instance for one command, that require the user to set the command string when this
class is instantiated. By this way, the get_output and get_result API can get the
corresponding value by executing the command once. All result will be stored in class after
the command executed.
	-- the other usage is one instance for multiple commands, the caller should input the cmd
when calling get_output, get_result, and the corresponding command will be executed seperately.

The two usage are specified when in instantiating. If the cmd is not specified in instantiating,
then the instance will enter the second usage, else will enter the first usage.
---------------------------------------------------------------------------------------------
"""

import subprocess;

class shell: ## {

	## use the underscore preffixed to declare the local variable.
	## this var indicates the command string used by current class.
	__cmd = None;

	## the string value determined by the internal class within 'OO' and 'OM'.
	## 'OO': one instance for one command mode.
	## 'OM': one instance for multiple commands mode, this is the default mode
	__mode = 'OM';

	## declare an empty list for storing the executed contents.
	__out = [];

	## declared for executed result.
	__sh_rst = None;


	def __init__(self, cmd = None): ## {
		self.__cmd = cmd;
		if not cmd: self.__mode = 'OM'; ## if the cmd is None, the mode is OM
		else: ## {
			self.__mode = 'OO'; ## else if the cmd is not None, the mode is OO.
			## in OO mode, the command will be executed when it is instantiated, and the output and result wil be stored in
			## the privative member
			obj = subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT);
			self.__sh_rst = obj.wait(); ## store the result to corresponding member
			self.__out    = self.__out_formated(obj.readlines()); ## store the stdout or stderr to corresponding member
		## }
		return;
	## }

	## an API to get the output information of target shell command.
	## if command here not specified, then the program will check the command of class member: __cmd.
	## if it is also not specified, then the program will report an error and exit this program.
	## nomatter what command it is, when calling get_output, only information in output will be captured.
	##
	def get_output(self,cmd = None): ## {
		"""
		.In OO mode, cmd arg will be ignored.
		.In OM mode, cmd must not None, or will report fatal.
		.Return type is list, is the formatted output list.
		"""
		## judge the __mode first
		if self.__mode == 'OO': ## {
			## in OO mode, return the output information in __out
			return self.__out;
		## }
		else: ## {
			## in OM mode, first to check the cmd
			self.__check_cmd(self,cmd); ## if cmd is None, this func. will terminated the whole program with PE.
			## else, to do the shell command
			obj = subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT);
			return self.__out_formated(obj.readlines());
		## }
	## }

	## this API to get the result value of input command, also, this func. should first to get the valid
	## command.
	## return type of this command:
	## None: program error occurred.
	## int: the command result.
	##
	def get_result(self,cmd = None): ## {
		"""
		.In OO mode, cmd arg will be ignored
		.In OM mode, cmd must not None, or will report fatal
		.Return type is int
		"""
		if self.__mode == 'OO': ## {
			return self.__sh_rst;
		## }
		else: ## {
			## in OM mode, first to check the cmd
			self.__check_cmd(self,cmd); ## if cmd is None, then this program will terminate the program
			obj = subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT);
			return obj.wait(); ## return the result by calling wait.
		## }
	## }

	## a internal func. of this class to check if the cmd is None, if it is, then report fatal and exit
	def __check_cmd(self, cmd): ## {
		"""
		.No return type.
		"""
		if cmd == None: ## {
			## if cmd is None, then to check the self.__cmd
			rpt.fatal("[__check_cmd] fatal occurred in report module, no command found."); ## call func. to report a fatal error.
			exc.exit_pe();
		## }
		return;
	## }

	## a internal func. to formated the list contents in out arg.
	##
	def __out_formated(self, outs): ## {
		__out_f = [];
		for out in outs: ## {
			## ergodic the outs list.
			__out_f.append(out.decode().strip());
		## }
		return __out_f;
	## }

## }
