//-----------------------------------------------------------------------------
// Copyright (c) 2009-2018 Benjamin Buch
//
// https://github.com/bebuch/big
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at https://www.boost.org/LICENSE_1_0.txt)
//-----------------------------------------------------------------------------
#ifndef _big__exception__hpp_INCLUDED_
#define _big__exception__hpp_INCLUDED_

#include <stdexcept>

namespace big{


	/// \brief Exception class that will throws by load or save big files
	struct big_error: std::runtime_error{
		using std::runtime_error::runtime_error;
	};


}

#endif
