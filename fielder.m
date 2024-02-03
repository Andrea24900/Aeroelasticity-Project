function field=fielder(content,field_number)
%this function builds the 8 char field with the correct spacing

%all fields except for field 1
if field_number>1
field=pad(content,8,"left");
else
    field=pad(content,8,"right");
end