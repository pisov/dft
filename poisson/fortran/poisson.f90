module functions
implicit none
contains
    function f(x)
        double precision, intent(in) :: x
        double precision :: f

        if (x .gt. 0.d0) then
            f = -x * (x + 3) * exp(x)
        else
            f =  abs(x) * (abs(x) + 3) * exp(abs(x))
        end if
    end function f
end module functions

program poisson
use functions
implicit none
      include "fftw3.f"

      integer :: n
      parameter (n=128)

      integer*8 plan, iplan

      double precision, dimension(N) :: uReal, uFurier
      double precision, dimension(N) :: fReal, fFurier
      double precision, dimension(N) :: sReal, sFurier
      double precision :: pi, x, freq, delta, L, xmin, xmax
      double precision :: timeDomainSum, freqDomainSum

      integer :: i

      pi = 3.141592653589793d0
      xmin =  0.d0
      xmax =  1.d0
      L = xmax - xmin
      delta = L / (n+1)

      call DFFTW_PLAN_R2R_1D(plan,   n, fReal,   fFurier,  FFTW_RODFT00, FFTW_ESTIMATE)
      call DFFTW_PLAN_R2R_1D(iplan,  n, uFurier,   uReal,  FFTW_RODFT00, FFTW_ESTIMATE)

      do i=1,n
         x = xmin + i * delta
         fReal(i) = f(x)
         sReal(i) = x * (x-1) * exp(x)
      enddo

      call dfftw_execute(plan)
      call DFFTW_PLAN_R2R_1D(plan,   n, sReal,   sFurier,  FFTW_RODFT00, FFTW_ESTIMATE)
      call dfftw_execute(plan)

      !
      ! Apply solution here
      !

      call dfftw_execute(iplan)
      uReal(:) = uReal(:) / (2*(n+1))

      do i = 1, n
          x = xmin + i * delta
          freq = i
                  write(*,'(9F15.5)')x, freq, uReal(i), uFurier(i),&
&                  fReal(i), fFurier(i), sReal(i), sFurier(i),&
&                  sFurier(i)/fFurier(i)
      end do

      write(0,*) 'Parsewal sum time domain: ',sum(abs( uReal)**2)
      write(0,*) 'Parsewal sum freq domain: ',sum(abs(uFurier)**2)/(2*(n+1))

      call dfftw_destroy_plan(plan)
      call dfftw_destroy_plan(iplan)

      end

