%%Setup
% Clear workspace
clear
% Clear webcam
clear webcam
% Connect to the webcam
camera = webcam(2);
% Take a single image from cam
img = snapshot(camera);

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

while ishandle(h)
    % Take snapshot
    im = snapshot(camera);
    % Display image
    image(im)
    % Resize to the input size of the network [NOTE: must be done before calling
    % `classify`]
    im = imresize(im,inputSize);
    % Classify 
    [label,score] = classify(nnet,im);
    % Display predicted label and its probablity
    title({char(label), num2str(max(score),2)});
    % At each iteration update the figure
    drawnow
end