program fft_2d 
implicit none
      include "fftw3.f"

      integer n, m
      parameter (n=128)
      parameter (m=128)

      integer*8 plan, iplan

      double precision, dimension(n, m) :: inVec, outVec
      double precision :: timeDomainSum, freqDomainSum
      double precision :: x, y, dx, dy, x0, y0, sig, pi, f
      parameter (pi = 3.141592653589793d0)

      integer :: i, j

      sig = 0.1d0
      x0 = 0.5d0
      y0 = 0.5d0
      dx = 1.d0 / (n - 1)
      dy = 1.d0 / (m - 1)

      do j = 1, m
         y = (j-1) * dy
         do i = 1, n
           x = (i-1) * dx
!           f = exp(-((x-x0)**2+(y-y0)**2)/(2*sig**2))/(sqrt(2*pi)*sig)
           f = x*y*(1-x)*(1-y)*exp(x+y)
           inVec(i, j) = f 
         end do
      end do

      call DFFTW_PLAN_R2R_2D( plan, n, m,  inVec, outVec, FFTW_RODFT00, FFTW_RODFT00, FFTW_ESTIMATE)
      call DFFTW_PLAN_R2R_2D(iplan, n, m, outVec,  inVec, FFTW_RODFT00, FFTW_RODFT00, FFTW_ESTIMATE)

      call dfftw_execute( plan)
      call dfftw_execute(iplan)
      inVec(:,:) = inVec(:,:)/(4*(n+1)*(m+1))

      do j = 1, m
         y = (j-1) * dy
         do i = 1, n
           x = (i-1) * dx
           write(*,'(3E20.8)')x,y,inVec(i,j)
         end do
      end do

      call dfftw_destroy_plan( plan)
      call dfftw_destroy_plan(iplan)

end program fft_2d 
