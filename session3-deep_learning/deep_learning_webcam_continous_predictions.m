%%Setup
% Clear workspace
clear
% Clear webcam
clear webcam
% Connect to the webcam
camera = webcam(2);

%% Load the pretrained GoogLeNet network
% GoogLeNet, a pretrained deep convolutional neural network (CNN or ConvNet) 
% has been trained on over a million images and can classify images into 
% 1000 object categories.
nnet = googlenet;

%% Classify snapshots
% Resize the image to the input size of the network
inputSize = nnet.Layers(1).InputSize(1:2);
% Create the figure window
h = figure;
% Resize the window to have twice the width
h.Position(3) = 2*h.Position(3);
% Create two subplots
ax1 = subplot(1,2,1);
ax2 = subplot(1,2,2);
% Prevent the axes from resizing
ax2.PositionConstraint = 'innerposition';

%% Continuously display and classify images together 
while ishandle(h)
    % Display and classify the image
    im = snapshot(camera);
    image(ax1,im)
    im = imresize(im,inputSize);
    [label,score] = classify(nnet,im);
    title(ax1,{char(label),num2str(max(score),2)});

    % Select the top five predictions
    [~,idx] = sort(score,'descend');
    idx = idx(5:-1:1);
    scoreTop = score(idx);
    classes = nnet.Layers(end).Classes;
    classNamesTop = string(classes(idx));

    % Plot the histogram
    barh(ax2,scoreTop)
    title(ax2,'Top 5')
    xlabel(ax2,'Probability')
    xlim(ax2,[0 1])
    yticklabels(ax2,classNamesTop)
    ax2.YAxisLocation = 'right';
    
    % At each iteration update the figure
    drawnow
end