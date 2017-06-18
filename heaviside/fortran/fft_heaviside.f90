program test
implicit none
      include "fftw3.f"

      integer n,nf
      parameter (n=128)

      integer*8 plan, iplan

      double complex in, out
      dimension in(N), out(N)
      double precision :: hi, pi, x
      double precision :: timeDomainSum, freqDomainSum
      double precision :: deltai, fi

      integer :: i

      pi = 3.141592653589793d0
!      delta = 1.d0 / n 

      do i=1,n
         x = (i-1.d0) / (n - 1)
         if (x <= 0.5d0) then
           in(i) = cmplx(1.d0, 0.d0)
         else
           in(i) = cmplx(0.d0, 0.d0)
         end if
      enddo


      call dfftw_plan_dft_1d(plan, n,in,out,fftw_forward, FFTW_ESTIMATE)


      call dfftw_execute(plan)

      do i=1,n
         if (i < n/2) then
           fi = i - 1
         else
           fi = i - n - 1
         end if
         write(*,'(6F15.5)')(i-1.d0) / (n - 1), fi, real(in(i)), real(out(i)), aimag(out(i)), abs(out(i))
      enddo

      write(0,*) 'Parsewal sum time domain: ',sum(abs( in)**2)
      write(0,*) 'Parsewal sum freq domain: ',sum(abs(out)**2 / n)

      call dfftw_destroy_plan(plan)

      end
