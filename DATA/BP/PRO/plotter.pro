data=get_data('data.dat')
dd=reform(data(0,*))
mm=reform(data(1,*))
yy=reform(data(2,*))
hh=reform(data(3,*))
mi=reform(data(4,*))
bp1=reform(data(5,*))
bp2=reform(data(6,*))
pu=reform(data(7,*))
jd=julday(mm,dd,yy,hh,mi)
fryear=yy+(mm-1)/12.+dd/365.25+hh/24./365.25+mi/60./24./365.25
!P.MULTI=[0,1,3]
!P.thick=4
!x.thick=4
!y.thick=4
!P.charsize=2.2
plot,fryear,bp1,ystyle=3,xstyle=3,xtitle='Year',psym=3
bp1_smoo=smooth(bp1,35,/edge_truncate)
oplot,fryear,bp1_smoo,color=fsc_color('red')
res=robust_linefit(fryear,bp1,yhat)
print,'Trend: ',res(1),' mmHg/Year',format='(a,f5.1,a)'
xyouts,2017.5,170,/data,strcompress('Trend: '+string(res(1),format='(f5.1)')+' mmHg/Year')
plot,fryear,bp2,ystyle=3,xstyle=3,xtitle='Year',psym=3
bp2_smoo=smooth(bp2,35,/edge_truncate)
oplot,fryear,bp2_smoo,color=fsc_color('red')
res=robust_linefit(fryear,bp2,yhat)
print,'Trend: ',res(1),' mmHg/Year',format='(a,f5.1,a)'
xyouts,2017.5,100,/data,strcompress('Trend: '+string(res(1),format='(f5.1)')+' mmHg/Year')
!P.MULTI=[2,2,3]
histo,bp1,110,180,1,/abs
oplot,[median(bp1),median(bp1)],!Y.crange
histo,bp2,50,110,1,/abs
oplot,[median(bp2),median(bp2)],!Y.crange
end
