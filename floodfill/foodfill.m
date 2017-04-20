function foodfill(startx,starty)
global image;
vertex=[-1 -1 -1 0 0 1 1 1;-1 0 1 -1 1 -1 0 1];
head=0;
tail=1;
queue(tail,1)=startx;
queue(tail,2)=starty;
image(startx,starty)=144;
while (head<tail)
    head=head+1;
    nowx=queue(head,1);
    nowy=queue(head,2);
    for i=1:8;
        nextx=nowx+vertex(1,i);
        nexty=nowy+vertex(2,i);
        if (image(nextx,nexty)~=144)
            tail=tail+1;
            queue(tail,1)=nextx;
            queue(tail,2)=nexty;
            image(nextx,nexty)=144;
        end
    end
end

    