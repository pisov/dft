program heaviside 
implicit none
      include "fftw3.f"

      integer n
      parameter (n=128)

      integer*8 plan, iplan

      double complex, dimension(N) :: inVec, outVec
      double precision :: timeDomainSum, freqDomainSum
      double precision :: pi, x, delta, fi, t0

      integer :: i

      pi = 3.141592653589793d0
      delta = 1.d0 / (n - 1)

      do i = 1, n
         x = (i-1) * delta
         if (x <= 0.5d0) then
           inVec(i) = cmplx(1.d0, 0.d0)
         else
           inVec(i) = cmplx(0.d0, 0.d0)
         end if
      enddo

      call dfftw_plan_dft_1d(plan, n, inVec, outVec, FFTW_FORWARD, FFTW_ESTIMATE)

      call dfftw_execute(plan)

      do i = 1, n
         if (i < n/2) then
           fi = i - 1
         else
           fi = i - n - 1
         end if
         write(*,'(6F15.5)')(i-1) * delta, fi, real(inVec(i)), real(outVec(i)), aimag(outVec(i)), abs(outVec(i))
      enddo

      write(0,*) 'Parsewal sum time domain: ',sum(abs( inVec)**2)
      write(0,*) 'Parsewal sum freq domain: ',sum(abs(outVec)**2 / n)

      call dfftw_destroy_plan(plan)

end program heaviside
