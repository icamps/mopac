! Molecular Orbital PACkage (MOPAC)
! Copyright (C) 2021, Virginia Polytechnic Institute and State University
!
! MOPAC is free software: you can redistribute it and/or modify it under
! the terms of the GNU Lesser General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.
!
! MOPAC is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU Lesser General Public License for more details.
!
! You should have received a copy of the GNU Lesser General Public License
! along with this program.  If not, see <https://www.gnu.org/licenses/>.

double precision function invfn (x, qn, mode)
    implicit none
    integer, intent (in) :: qn, mode
    double precision, intent (in) :: x
    double precision :: x0, x1, ans0, ans1, new
    intrinsic Abs
    ans0 = 2.0d0
    x0 = fn(ans0, qn, mode) - x
    ans1 = ans0 * 1.1d0
    new = 0.d0
    do
      x1 = fn(ans1, qn, mode) - x
      if (Abs (x0-x1) < 1.d-10) exit
      new = ans0 + x0 * (ans1-ans0) / (x0-x1)
      if (Abs(x1) < 1.d-10) exit
      x0 = x1
      ans0 = ans1
      ans1 = new
    end do
    invfn = new
contains
    double precision function fn (x, qn, mode)
   !
   !.. Implicit Declarations ..
      implicit none
   !
   !.. Formal Arguments ..
      integer, intent (in) :: qn, mode
      double precision, intent (in) :: x
   !
   !.. External Calls ..
      double precision, external :: rsc
      fn = 0.d0
      select case (mode)
      case (0)
    !
    !  Calculate Gss given the principal quantum number
    !  and Slater exponent for the "s" orbital.
    !
        fn = rsc (0, qn, x, qn, x, qn, x, qn, x)
      case (1)
    !
    !  Calculate Gpp given the principal quantum number
    !  and Slater exponent for the "p" orbital.
    !
        fn = rsc (0, qn, x, qn, x, qn, x, qn, x) + 0.16d0 * rsc (2, qn, x, qn, &
       & x, qn, x, qn, x)
      case (2)
    !
    !  Calculate Gdd given the principal quantum number
    !  and Slater exponent for the "d" orbital.
    !
        fn = rsc (0, qn, x, qn, x, qn, x, qn, x) + 4.d0 / 49.d0 * (rsc (2, qn, &
       & x, qn, x, qn, x, qn, x)+rsc (4, qn, x, qn, x, qn, x, qn, x))
      end select
      return
    end function fn
end function invfn

