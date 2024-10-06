set WORKSPACE=.

set GEN_CLIENT="%WORKSPACE%/Luban.ClientServer/Luban.ClientServer"
set CONF_ROOT=.

%GEN_CLIENT% -j cfg --^
 -d %CONF_ROOT%/Defines/__root__.xml ^
 --input_data_dir %CONF_ROOT%\Datas ^
 --output_data_dir ../jynew_xfg/Data ^
 --gen_types data_json ^
 -s all 

pause