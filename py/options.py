#! /usr/bin/env python3


"""
---------------------------------------------------------------------------------------------
# File    : options.py
# Author  : Neo.H
# Date    : Sep 19, 2018
# Version : v1.00
---------------------------------------------------------------------------------------------
This is a class for options check and detect.
----------------------------------------------------------------------------------------------------
inputs:
	-- support options.
	-- input command options.
----------------------------------------------------------------------------------------------------
outputs:
	-- supported APIs
----------------------------------------------------------------------------------------------------
APIs:
	-- pop_option: pop one option dict handler, which contains the option information.
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
"""


class options: ## {

	__owner__ = 'Neo.H';

	def __init__(self,argvs,sopts): ## {
		"""
		the format of sopts is:
		-- sopts['name']:
			-> ['param']: parameter of this option
			-> ['fmt']: format of this option
			-> ['desc']: description
		In initial function, the program will get option from argvs list, and then check if support
		sopts.
		"""
		## opt_f, a list for specified options, used to check directly with input options.
		opt_f = self.__get_format_opts(sopts);
		for argv in argvs: ## {
			if argv in opt_f: ## {
				## if current argv in supported formated option.
			## }
		## }
		return;
	## }


	def pop_option(self,): ## {
		"""
		A func. to pop one option according to the option name and delete the item in option list. If no
		corresponding option handler found, then return None. So for multipile options, use while (pop_option())
		to pop until no corresponding option exists.
		"""
	## }

	## ---------------------------------------------------------------------------------------------------- ##
	def __get_format_opts(self,sopts): ## {
		"""
		A func. to get from sopts dict, and return to a list that contain options can be compared with input
		command options directly.
		"""
		opts_f = [];
		opts = sopts.keys();

		for opt in opts: ## {
			if sopts[opt]['fmt'] == '-': ## {
				## this block indicates the format of -opt <param>
				opts_f.append('-'+opt);
			## }
			else if sopts[opt]['fmt'] == '++': ## {
				## this block indicates the format of option: +opt+<param>, in this format, the option must has
				## parameter.
				opts_f.append('+'+opt+'+');
			##}
			else if sopts[opt]['fmt'] == '+=': ## {
				## this block indicates the formatf of option: +opt=<param>, in this format, the option must has
				## the parameter.
				opts_f.append('+'+opt+'=');
			## }
			else: ## {
				print(" [SFATAL][options] fatal error occurred when calling __get_format_opts, developer fatal. Please contact creator: "+self.__owner__);
			## }
		## }


		return opts_f;
	## }
	## ---------------------------------------------------------------------------------------------------- ##

## }
