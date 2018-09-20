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

	## var valid only in 'OO' mode, to specify if the command is executed or not, if is True, then
	## calling get_output or get_result will not execute the command.
	##
	__executed = False;

	## TODO

	def __init__(self, cmd = None): ## {
		self.__cmd = cmd;
		if not cmd: self.__mode = 'OM'; ## if the cmd is None, the mode is OM
		else: self.__mode = 'OO'; ## else if the cmd is not None, the mode is OO.
		return;
	## }

	## an API to get the output information of target shell command.
	## if command here not specified, then the program will check the command of class member: __cmd.
	## if it is also not specified, then the program will report an error and exit this program.
	## nomatter what command it is, when calling get_output, only information in output will be captured.
	##
	def get_output(self,cmd = None): ## {
		out_f = None;
		## step 1. to choose the arg of this function
		vcmd = self.__get_vld_cmd(cmd);
		## if program executed here, that means the vcmd is a valid command.

		## step 2. calling shell commands by using the valid cmd
		obj = subprocess.Popen(vcmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE);
		obj.wait(); ## wait the command end.
		(out,err) = obj.communicate(); ## calling this func. to get the command stdout, stderr information.
		if out != None: out_f = out.decode().strip();  ## format the output information.
		return out_f; ## return the formatted output.
	## }

	## this API to get the result value of input command, also, this func. should first to get the valid
	## command.
	## return type of this command:
	## None: program error occurred.
	## int: the command result.
	##
	def get_result(self,cmd = None): ## {
		sh_rst = 0; ## default result is 0.
		## step 1. to choose the arg of this func.
		vcmd = self.__get_vld_cmd(self,cmd);
		if vcmd == None: return None; ## if vcmd eq None, then return this func.
		obj = subprocess.Popen(vcmd,shell=True);
		sh_rst = obj.wait();
		return sh_rst;
	## }


	## a internal func. of this class to get the valid command, if no caller enterred and no class default
	## command, then the program will exit with a fatal.
	def __get_vld_cmd(self, cmd): ## {
		r_cmd = None;
		if cmd == None: ## {
			## if cmd is None, then to check the self.__cmd
			## if self.__cmd is not None, then assign self.__cmd to cmd
			if self.__cmd == None: ## {
				## if the command in class is also None, then need to print the PE exit process
				rpt.fatal("[__get_vld_cmd] fatal occurred in report module, no command found."); ## call func. to report a fatal error.
				exc.exit_pe();
			## }
			else: ## {
				## else block, if the self.__cmd is not None, but the cmd arg is None, then use self.__cmd
				##
				r_cmd = self.__cmd;
			## }
		else: return cmd;
		## }
		return r_cmd; ## return the valid cmd
	## }


## }
