%Carrega a imagem a ser transformada
Im1 = imread('UFSC.jpg');

tam1 = size(Im1);

%recorta a imagem para um tamanho manuseável
Im2 = Im1(99:906,20:564);

tam2 = size(Im2);

% pontos na imagem Im1 retirados pela ferramenta imtool
%P1 = [50;470;308;638;548;382;320;282]; %imagem original
P1 = [29;367;289;533;524;285;300;186];

% pontos desejados -> estimação 
%P2 = [90;350;90;550;500;550;500;350];
x1 = 80; x2 = 465;
y1 = 210;
y2 = 480;
P2 = [x1;y1;x1;y2;x2;y2;x2;y1];

A = [P1(1) P1(2) 1 0 0 0 -P2(1)*P1(1) -P2(1)*P1(2);
     0 0 0 P1(1) P1(2) 1 -P2(2)*P1(1) -P2(2)*P1(2);
     P1(3) P1(4) 1 0 0 0 -P2(3)*P1(3) -P2(3)*P1(4);
     0 0 0 P1(3) P1(4) 1 -P2(4)*P1(3) -P2(4)*P1(4);
     P1(5) P1(6) 1 0 0 0 -P2(5)*P1(5) -P2(5)*P1(6);
     0 0 0 P1(5) P1(6) 1 -P2(6)*P1(5) -P2(6)*P1(6);
     P1(7) P1(8) 1 0 0 0 -P2(7)*P1(7) -P2(7)*P1(8);
     0 0 0 P1(7) P1(8) 1 -P2(8)*P1(7) -P2(8)*P1(8)];

H = zeros(8,1); 
H = inv(A)*P2;

%Checa os máximos e mínimos das novas coordenadas
u_min = 0;
u_max = 0;
v_min = 0;
v_max = 0;

for y=1:tam2(1)
    
    for x=1:tam2(2)
        u = round((H(1)*x + H(2)*y + H(3))/(H(7)*x + H(8)*y + 1)); %u=x
        v = round((H(4)*x + H(5)*y + H(6))/(H(7)*x + H(8)*y + 1)); %v=y
               
        if u<u_min
            u_min=u;
        end
        if u>u_max
            u_max=u;
        end
        if v<v_min
            v_min=v;
        end
        if v>v_max
            v_max=v;
        end
        
    end
end

%fator de correção para a matriz começar em 1
fat_cor_x = -u_min + 1;

fat_cor_y = -v_min + 1;


New_matrix = uint8(zeros((v_max-v_min),(u_max-u_min))+255);

for y=1:tam2(1)
    
    for x=1:tam2(2)
        u = round((H(1)*x + H(2)*y + H(3))/(H(7)*x + H(8)*y + 1)); %u=x
        v = round((H(4)*x + H(5)*y + H(6))/(H(7)*x + H(8)*y + 1)); %v=y
               
        New_matrix(v+fat_cor_y,u+fat_cor_x) = Im1(y,x);
    end
end

%imtool(New_matrix);

%recorta para um padrão de comparação
imagem_original = Im2(170:550,1:545);
imagem_corrigida = New_matrix(712:973,185:530);

subplot(1,2,1);
imshow(imagem_original);

subplot(1,2,2);
imshow(imagem_corrigida);



