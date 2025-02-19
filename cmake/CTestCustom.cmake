# Molecular Orbital PACkage (MOPAC)
# Copyright (C) 2021, Virginia Polytechnic Institute and State University
#
# MOPAC is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# MOPAC is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

set( CTEST_CUSTOM_PRE_TEST "${LCOV_PATH} --gcov-tool ${GCOV_PATH} --zerocounters --directory ${CMAKE_CURRENT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}" )
set( CTEST_CUSTOM_POST_TEST "${LCOV_PATH} --gcov-tool ${GCOV_PATH} --capture --directory ${CMAKE_CURRENT_BINARY_DIR}${CMAKE_FILES_DIRECTORY} --output-file ${CMAKE_CURRENT_BINARY_DIR}/coverage.info; genhtml ${CMAKE_CURRENT_BINARY_DIR}/coverage.info --output-directory ${CMAKE_CURRENT_BINARY_DIR}/coverage" )
