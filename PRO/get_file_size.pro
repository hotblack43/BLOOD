FUNCTION get_file_size,file
rnd_filename,size_filename
spawn,'wc '+file+' > '+size_filename
n=0L
openr,luin,size_filename, /get_lun
readf,luin,n
close,luin
free_lun,luin
spawn,'rm '+size_filename
get_file_size=n
return,get_file_size
end
