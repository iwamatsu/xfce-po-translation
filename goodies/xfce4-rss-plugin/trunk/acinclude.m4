## this one is commonly used with AM_PATH_PYTHONDIR ...
dnl AM_CHECK_PYMOD(MODNAME [,SYMBOL [,ACTION-IF-FOUND [,ACTION-IF-NOT-FOUND [,PYGTK_ABI]]]])
dnl Check if a module containing a given symbol is visible to python.
AC_DEFUN([AM_CHECK_PYMOD],
[AC_REQUIRE([AM_PATH_PYTHON])
py_mod_var=`echo $1['_']$2 | sed 'y%./+-%__p_%'`
AC_MSG_CHECKING(for ifelse([$2],[],,[$2 in ])python module $1)
AC_CACHE_VAL(py_cv_mod_$py_mod_var, [
ifelse([$2],[], [prog="
import sys
try:
	ifelse([$5], [],, [import pygtk; pygtk.require('$5')])
        import $1
except ImportError:
        sys.exit(1)
except:
        sys.exit(1)
sys.exit(0)"], [prog="
import $1
$1.$2"])
if $PYTHON -c "$prog" 1>&AC_FD_CC 2>&AC_FD_CC
  then
    eval "py_cv_mod_$py_mod_var=yes"
  else
    eval "py_cv_mod_$py_mod_var=no"
  fi
])
py_val=`eval "echo \`echo '$py_cv_mod_'$py_mod_var\`"`
if test "x$py_val" != xno; then
  AC_MSG_RESULT(yes)
  ifelse([$3], [],, [$3
])dnl
else
  AC_MSG_RESULT(no)
  ifelse([$4], [],, [$4
])dnl
fi
])

dnl AM_CHECK_PYGTK(ABI_VERSION, VERSION[, ACTION-IF-FOUND [,ACTION-IF-NOT-FOUND]])
dnl Check if pygtk with the givin ABI/Version is installed
dnl VERSION should be a tuple of 3 integers, not a string!
AC_DEFUN([AM_CHECK_PYGTK],
[AC_REQUIRE([AM_PATH_PYTHON])
AC_MSG_CHECKING([for pygtk-$1 version $2])
prog="
import sys
try:
	import pygtk; pygtk.require('$1')
	import gtk
except:
        sys.exit(1)
if gtk.pygtkversion >= $2:
        sys.exit(0)
else:
	sys.exit(1)
"
if $PYTHON -c "$prog" 1>&AC_FD_CC 2>&AC_FD_CC ; then
  AC_MSG_RESULT(yes)
  ifelse([$3], [],, [$3
])dnl
else
  AC_MSG_RESULT(no)
  ifelse([$4], [],, [$4
])dnl
fi
])

dnl a macro to check for ability to create python extensions
dnl  AM_CHECK_PYTHON_HEADERS([ACTION-IF-POSSIBLE], [ACTION-IF-NOT-POSSIBLE])
dnl function also defines PYTHON_INCLUDES
AC_DEFUN([AM_CHECK_PYTHON_HEADERS],
[AC_REQUIRE([AM_PATH_PYTHON])
AC_MSG_CHECKING(for headers required to compile python extensions)
dnl deduce PYTHON_INCLUDES
py_prefix=`$PYTHON -c "import sys; print sys.prefix"`
py_exec_prefix=`$PYTHON -c "import sys; print sys.exec_prefix"`
PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
if test "$py_prefix" != "$py_exec_prefix"; then
  PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
fi
AC_SUBST(PYTHON_INCLUDES)
dnl check if the headers exist:
save_CPPFLAGS="$CPPFLAGS"
CPPFLAGS="$CPPFLAGS $PYTHON_INCLUDES"
AC_TRY_CPP([#include <Python.h>],dnl
[AC_MSG_RESULT(found)
$1],dnl
[AC_MSG_RESULT(not found)
$2])
CPPFLAGS="$save_CPPFLAGS"
])

dnl Check for XML catalog definitions
dnl AM_CHECK_XML_CATALOG(type, identifier, action-if-found, action-if-not-found)
AC_DEFUN([AM_CHECK_XML_CATALOG],
[
type=$1
ident=$2
AC_MSG_CHECKING([for ${type} "${ident}"])
xxx=$(echo "${type} '${ident}'" | xmlcatalog --shell)
if echo $xxx | grep '^> No entry' > /dev/null; then
   AC_MSG_RESULT([not found!])
   $4
else
   AC_MSG_RESULT([found.])
   $3
fi
unset type ident xxx
])

