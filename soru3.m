vidObj = VideoReader('hw2.mp4');
v = VideoWriter('result', 'Motion JPEG AVI');
v.Quality = 95;
open(v);
while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    A = median_filtering(vidFrame);
    writeVideo(v,A);
end
close(v);
