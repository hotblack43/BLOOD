data=get_data('weight.dat')
dd=reform(data(0,*))
mm=reform(data(1,*))
yy=reform(data(2,*))
hh=reform(data(3,*))
mi=reform(data(4,*))
weight=reform(data(5,*))
jd=julday(mm,dd,yy,hh,mi)
fryear=yy+(mm-1)/12.+dd/365.25+hh/24./365.25+mi/60./24./365.25
!P.MULTI=[0,1,2]
!P.thick=4
!x.thick=4
!y.thick=4
!P.charsize=2.2
plot,fryear,weight,ystyle=3,xstyle=3,xtitle='Year',psym=3
weight_smoo=smooth(weight,35,/edge_truncate)
oplot,fryear,weight_smoo,color=fsc_color('red')
res=robust_linefit(fryear,weight,yhat)
print,'Trend: ',res(1),' kg/Year',format='(a,f5.1,a)'
xyouts,2017.5,170,/data,strcompress('Trend: '+string(res(1),format='(f5.1)')+' mmHg/Year')
!P.MULTI=[2,2,3]
!X.style=3
histo,weight,95,102,0.1,/abs
end
