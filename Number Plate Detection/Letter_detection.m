function letter=readLetter(snap)

load NewTemplates 
snap=imresize(snap,[42 24]); 
rec=[ ];

for n=1:length(NewTemplates)
    cor=corr2(NewTemplates{1,n},snap);
    rec=[rec cor]; 
end

ind=find(rec==max(rec));

% Alphabets listings.
if ind==1 || ind==2
    letter='A';
elseif ind==3 || ind==4
    letter='B';
elseif ind==5
    letter='C';
elseif ind==6 || ind==7
    letter='D';
elseif ind==8
    letter='E';
elseif ind==9
    letter='F';
elseif ind==10
    letter='G';
elseif ind==11
    letter='H';
elseif ind==12
    letter='I';
elseif ind==13
    letter='J';
elseif ind==14
    letter='K';
elseif ind==15
    letter='L';
elseif ind==16
    letter='M';
elseif ind==17
    letter='N';
elseif ind==18 || ind==19
    letter='O';
elseif ind==20 || ind==21
    letter='P';
elseif ind==22
    letter='Q';
elseif ind==24 || ind==25
    letter='R';
elseif ind==26
    letter='S';
elseif ind==27
    letter='T';
elseif ind==28
    letter='U';
elseif ind==29
    letter='V';
elseif ind==30
    letter='W';
elseif ind==31
    letter='X';
elseif ind==32
    letter='Y';
elseif ind==33
    letter='Z';
    %*-*-*-*-*
% Numerals listings.
elseif ind==34
    letter='1';
elseif ind==35
    letter='2';
elseif ind==36
    letter='3';
elseif ind==37 || ind==38
    letter='4';
elseif ind==39
    letter='5';
elseif ind==40 || ind==41 || ind==42
    letter='6';
elseif ind==43
    letter='7';
elseif ind==44 || ind==45
    letter='8';
elseif ind==46 || ind==47 || ind==48
    letter='9';
else
    letter='0';
end

if(letter == '0')
    if(max(rec) > 0.62 && max(rec) < 0.711)
        letter = 'D';
    else
        if(max(rec) > 0.745 && max(rec) < 0.77)
            letter = 'Q';
        else
            letter = '0';
        end
    end
    
elseif(letter == 'S')
    if(max(rec) > 0.55 && max(rec) < 0.65) 
        letter = '5';
    else
        letter = 'S';
    end



elseif(letter == '5')
    if(max(rec) < 0.47 || max(rec) > 0.6)  
        letter = '5';
    else
        letter = '6';
    end

elseif(letter == '8')
    if(max(rec) < 0.5) 
        letter = 'B';
    else
        letter = '8';
    end

elseif(letter == 'T')
    if(max(rec) < 0.65)  
        letter = '1';
    else
        letter = 'T';
    end
end   
end