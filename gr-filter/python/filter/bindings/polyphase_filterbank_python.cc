/*
 * Copyright 2020 Free Software Foundation, Inc.
 *
 * This file is part of GNU Radio
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 *
 */

/***********************************************************************************/
/* This file is automatically generated using bindtool and can be manually edited  */
/* The following lines can be configured to regenerate this file during cmake      */
/* If manual edits are made, the following tags should be modified accordingly.    */
/* BINDTOOL_GEN_AUTOMATIC(0)                                                       */
/* BINDTOOL_USE_PYGCCXML(0)                                                        */
/* BINDTOOL_HEADER_FILE(polyphase_filterbank.h)                                        */
/* BINDTOOL_HEADER_FILE_HASH(8651c06a82eb420afdb769759d3fa4bd)                     */
/***********************************************************************************/

#include <pybind11/complex.h>
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>

namespace py = pybind11;

#include <gnuradio/filter/polyphase_filterbank.h>
// pydoc.h is automatically generated in the build directory
#include <polyphase_filterbank_pydoc.h>

void bind_polyphase_filterbank(py::module& m)
{


    py::module m_kernel = m.def_submodule("kernel");

    using polyphase_filterbank = ::gr::filter::kernel::polyphase_filterbank;


    py::class_<polyphase_filterbank, std::shared_ptr<polyphase_filterbank>>(
        m_kernel, "polyphase_filterbank", D(kernel, polyphase_filterbank))

        .def(py::init<unsigned int,
                      std::vector<float, std::allocator<float>> const&,
                      bool>(),
             py::arg("nfilts"),
             py::arg("taps"),
             py::arg("fft_forward") = false,
             D(kernel, polyphase_filterbank, polyphase_filterbank, 0))


        .def("set_taps",
             &polyphase_filterbank::set_taps,
             py::arg("taps"),
             D(kernel, polyphase_filterbank, set_taps))


        .def("print_taps",
             &polyphase_filterbank::print_taps,
             D(kernel, polyphase_filterbank, print_taps))


        .def("taps", &polyphase_filterbank::taps, D(kernel, polyphase_filterbank, taps))

        ;
}
