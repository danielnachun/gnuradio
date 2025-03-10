find_package(GMP)
if(NOT GMP_FOUND)
    message(STATUS "GMP not found; this is not a problem if MPIR can be found.")
    find_package(MPIR)
endif()

if(GMP_FOUND)
    message(STATUS "Using GMP.")
    set(GR_MPLIB_GMP True)
    set(MPLIB_DEFINITIONS "-DGR_MPLIB_GMP" ${GMP_DEFINITIONS})
    set(MPLIB_INCLUDE_DIR ${GMP_INCLUDE_DIR})
    set(MPLIB_LIBRARY ${GMP_LIBRARY})
    set(MPLIBXX_LIBRARY ${GMPXX_LIBRARY})
    set(MPLIB_PC_ADD_CFLAGS ${GMP_PC_ADD_CFLAGS})
elseif(MPIR_FOUND)
    message(STATUS "MPIR found")
    set(GR_MPLIB_MPIR True)
    set(MPLIB_DEFINITIONS "-DGR_MPLIB_MPIR" ${MPIR_DEFINITIONS})
    set(MPLIB_INCLUDE_DIR ${MPIR_INCLUDE_DIR})
    set(MPLIB_LIBRARY ${MPIR_LIBRARY})
    set(MPLIBXX_LIBRARY ${MPIRXX_LIBRARY})
    set(MPLIB_PC_ADD_CFLAGS ${MPIR_PC_ADD_CFLAGS})
else()
    return()
endif()

set(MPLIB_INCLUDE_DIRS ${MPLIB_INCLUDE_DIR})
set(MPLIB_LIBRARIES ${MPLIBXX_LIBRARY} ${MPLIB_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MPLIB DEFAULT_MSG MPLIBXX_LIBRARY MPLIB_LIBRARY MPLIB_INCLUDE_DIR)
mark_as_advanced(MPLIBXX_LIBRARY MPLIB_LIBRARY MPLIB_INCLUDE_DIR)

if (MPLIB_LIBRARIES AND NOT TARGET MPLib::mplib)
  add_library(MPLib::mplib INTERFACE IMPORTED)
  set_target_properties(MPLib::mplib PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${MPLIB_INCLUDE_DIRS}"
    INTERFACE_LINK_LIBRARIES "${MPLIB_LIBRARIES}"
  )
endif()
