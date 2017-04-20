% clear
% clc
% num=0;
% global image;
% image=rgb2gray(imread('pic.png'));
% %image=[144 144 144 144; 144 0 1 144; 144 1 0 144; 144 144 144 144];
% % for i=1:size(image,1)
% %     for j=1:size(image,2)
% %         if image(image(i,j)~=144)
% %             num=num+1;
% %             found(num)=image(i,j);
% %         end
% %     end
% % end
% vertex=[-1 -1 -1 0 0 1 1 1;-1 0 1 -1 1 -1 0 1];
% head=0;
% tail=1;
% sizeX=size(image,1);
% sizeY=size(image,2);
% queue(tail,1)=sizeX/2;
% queue(tail,2)=sizeY/2;
% flag=zeros(sizeX,sizeY);
% while (head<tail)
%     if (tail-head>200) break; end
%     head=head+1;
%     nowx=queue(head,1);
%     nowy=queue(head,2);
%     flag(nowx,nowy)=1;
%     for i=1:8;
%         nextx=nowx+vertex(1,i);
%         nexty=nowy+vertex(2,i);
%         if ( nextx>0 && nexty>0 && nextx<=sizeX && nexty<=sizeY && flag(nextx,nexty)==0)
%             tail=tail+1;
%             flag(nextx,nexty)=1;
%             queue(tail,1)=nextx;
%             queue(tail,2)=nexty;
%             if (image(nextx,nexty)~=144)%·¢ÏÖÉ«¿é
%                 num=num+1;
%                 if (num==2022)
%                     q=1;
%                 end
%                 if (image(nextx,nexty)>144)
%                     found(num)=0;
%                 else
%                     found(num)=1;
%                 end
%                 step(num,1)=nextx;
%                 step(num,2)=nexty;
%                 %['find the ' num2str(num) ' color : ' num2str(image(nextx,nexty)) ' at (' num2str(nextx) ',' num2str(nexty) ')']
%                 %['find the step have : ' num2str(tail)]
%                 foodfill(nextx,nexty);
%                 head=0;
%                 tail=1;
%                 queue(tail,1)=nextx;
%                 queue(tail,2)=nexty;
%                 
%                 %flag=zeros(size(image,1),size(image,2));
%                 break;
%             end
%         end
%     end
% end
% save 
'check down'
clear
clc
load matlab
st=found;
st=reshape(st,8,1045)';
byte=st(:,1)*128+st(:,2)*64+st(:,3)*32+st(:,4)*16+st(:,5)*8+st(:,6)*4+st(:,7)*2+st(:,8)*1;
answer=byte;
temp=uint8(zeros(35,1));
byte=[byte;temp];

check=reshape(byte,72,15);

sum(check)
% hold on;
% imshow(imread('pic.png'));
% line(step(:,2),step(:,1))
fid = fopen('binary1.png', 'wb');
for i = 1:length(found)
    fwrite(fid, found(i), 'ubit1');
end
fclose(fid);

fid = fopen('answer.txt', 'w');
for i = 1:length(answer)
    fwrite(fid, answer(i));
end
fclose(fid);
