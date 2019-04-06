%Carrega a imagem do rosto masculino
Im1 = imread('ManGray.jpg');

%Carrega a imagem do rosto masculino
Im2 = imread('WomanGray.jpg');

%Guarda o tamanho da imagem
tam = size(Im1);

%Realiza a cópia da imagem 1 para ser usada para inverter os rostos
Copy_im1 = Im1;

%Para o primeiro laço for há a inversão do rosto masculino para o feminino
for i=0:0.1:1
    
    for j=1:tam(1)      
        for k=1:tam(2)
            Im1(j,k)= (1-i)*Im1(j,k) + i*Im2(j,k);
        end
    end
       
    imshow(Im1);
    pause(0.01)
    
end

%No segundo laço for há a inversão do rosto feminino para o masculino
for i=0:0.1:1
    
    for j=1:tam(1)      
        for k=1:tam(2)
            Im1(j,k)= (1-i)*Im2(j,k) + i*Copy_im1(j,k);
        end
    end
       
    imshow(Im1);
    pause(0.01)
    
end