function varargout = Exercicio2(varargin)
% EXERCICIO2 MATLAB code for Exercicio2.fig
%      EXERCICIO2, by itself, creates a new EXERCICIO2 or raises the existing
%      singleton*.
%
%      H = EXERCICIO2 returns the handle to a new EXERCICIO2 or the handle to
%      the existing singleton*.
%
%      EXERCICIO2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXERCICIO2.M with the given input arguments.
%
%      EXERCICIO2('Property','Value',...) creates a new EXERCICIO2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Exercicio2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Exercicio2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Exercicio2

% Last Modified by GUIDE v2.5 06-Apr-2019 10:23:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Exercicio2_OpeningFcn, ...
                   'gui_OutputFcn',  @Exercicio2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Exercicio2 is made visible.
function Exercicio2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Exercicio2 (see VARARGIN)

% Choose default command line output for Exercicio2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Exercicio2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Exercicio2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Im1 = handles.Im1;
CpyIm1 = handles.CpyIm1;
tam1 = handles.tam1;

Im2 = handles.Im2;
tam2 = handles.tam2;

x = handles.x;
y = handles.y;

x=round((get(handles.slider3,'Value')*1899/100)+1);

Im1=CpyIm1;

Im1(y:(tam2(1)+y-1),x:(tam2(2)+x-1))=Im2;
imshow(Im1);

zoom = CpyIm1(y:(tam2(1)+y-1),x:(tam2(2)+x-1));
imshow(zoom,'Parent',handles.axes2);

handles.zoom=zoom;
guidata(hObject,handles);

handles.x=x;
guidata(hObject,handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Im1 = handles.Im1;
CpyIm1 = handles.CpyIm1;
tam1 = handles.tam1;

Im2 = handles.Im2;
tam2 = handles.tam2;

x = handles.x;
y = handles.y;

y=round(((get(handles.slider4,'Value')-100)/(-100)*566)+1);

Im1=CpyIm1;

Im1(y:(tam2(1)+y-1),x:(tam2(2)+x-1))=Im2;
imshow(Im1);

zoom = CpyIm1(y:(tam2(1)+y-1),x:(tam2(2)+x-1));
imshow(zoom,'Parent',handles.axes2);

handles.zoom=zoom;
guidata(hObject,handles);

handles.y=y;
guidata(hObject,handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

zoom = handles.zoom;

transform = handles.transform;

x_sld=get(handles.slider5,'Value');
y_sld=get(handles.slider6,'Value');
theta=get(handles.slider7,'Value');

tam_zoom =  size(zoom)

switch transform;
    case 0 %nothing
       imshow(zoom,'Parent',handles.axes3);
    
    case 1 %Escalamento
       %Esc = [x_sld 0 0; 0 y_sld 0; 0 0 1];
       %mat = affine2d(Esc);
       %out = imwarp(zoom,mat);
       
       %out = imresize(zoom, [round(y_sld*tam_zoom(1)) round(x_sld*tam_zoom(2))]);
       RI = imref2d(tam_zoom);
       RI.XWorldLimits = [0 round(x_sld*tam_zoom(2))];
       RI.YWorldLimits = [0 round(y_sld*tam_zoom(1))];
       axes(handles.axes3);
       imshow(zoom,RI);
       
       %AdjustedImage = imresize(zoom,[y_sld*tam_zoom(1) x_sld*tam_zoom(2)]);
       %imshow(AdjustedImage,'Parent', handles.axes3);
        
    case 2 %Espelhamento
       Esp = [1 0 0; 0 -1 0; 0 0 1];
       mat = affine2d(Esp);
       out = imwarp(zoom,mat);
       imshow(out,'Parent',handles.axes3);
       
    case 3 %Cisalhamento
       Cis = [1 x_sld 0; y_sld 1 0; 0 0 1];
       mat = affine2d(Cis);
       out = imwarp(zoom,mat);
       imshow(out,'Parent',handles.axes3);
        
    case 4 %Rotação
       Rot = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
       mat = affine2d(Rot);
       out = imwarp(zoom,mat);
       imshow(out,'Parent',handles.axes3);
       
end
%imshow(colocar imagem,'Parent',handles.axes3);


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
transform = 0;
handles.transform=transform;
guidata(hObject,handles);

switch(get(eventdata.NewValue,'Tag'));
    case 'radiobutton1'
        transform = 0;
        handles.transform=transform;
        guidata(hObject,handles);
    case 'radiobutton2'
        transform = 1;
        handles.transform=transform;
        guidata(hObject,handles);
    case 'radiobutton3'
        transform = 2;
        handles.transform=transform;
        guidata(hObject,handles);
    case 'radiobutton4'
        transform = 3;
        handles.transform=transform;
        guidata(hObject,handles);
    case 'radiobutton5'
        transform = 4;     
        handles.transform=transform;
        guidata(hObject,handles);
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
Im1 = imread('PanoramicGray.jpg');
CpyIm1 = Im1;
tam1 = size(Im1);

x=1;
y=567;

%inverte a cor da imagem
Im2 = imread('TelescopicGray.jpg');
tam2 = size(Im2);

for i=1:tam2(1)
    for j=1:tam2(2)
        if Im2(i,j)<100
            Im2(i,j)=255;
        else
            Im2(i,j)=0;
        end
    end
end

Im1(y:(tam2(1)+y-1),x:(tam2(2)+x-1))=Im2;
imshow(Im1);

handles.x=x;
guidata(hObject,handles);

handles.y=y;
guidata(hObject,handles);

handles.Im1=Im1;
guidata(hObject,handles);

handles.CpyIm1=CpyIm1;
guidata(hObject,handles);

handles.tam1=tam1;
guidata(hObject,handles);

handles.Im2=Im2;
guidata(hObject,handles);

handles.tam2=tam2;
guidata(hObject,handles);
% Hint: place code in OpeningFcn to populate axes1
