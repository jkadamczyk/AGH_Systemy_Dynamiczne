%Jakub Adamczyk

clear;

% menu do wyboru danego zadania
choice = menu('Wybierz zadanie: ', 'Stabilno?? punkt�w r�wnowagi', 'Wp?yw warto?ci epsilon na rozmiar otoczenia', 'Wp?yw nie spe?nienia za?o?e? twierdzenia 2', 'Dzia?anie twierdzenia 2');

% Switch z odpowiednimi numerami zadania:
switch choice
    case 1
        clear;
        %  Zbada? i zilustrowa? wykresami w dziedzine czasu (dla przyk?adu 1) i portretami fazowymi
        %  (dla przyk?ad�w 2 i 3) stabilno?? punkt�w r�wnowagi;
        
        %okreslenie czasu poczatkowego i koncowego
        t0 = 0;
        tk = 10;
        
        %przyklad 1:
        
        % epsilon ze wzoru w przyk?adzie
        epsilon = 0.5;
        %funkcja defiiuj?ca rownanie rozniczkowe do rozwiazania w osobnym
        %pliku
        handle = @function_handle1;
        figure;
        hold on;
        for x0=-4:0.5:4
            [TT,Y] = ode45(@(t, x) handle(t,x, epsilon), [t0,tk], x0);
            plot(TT, Y, 'r');
            ylabel('x(t)');
            xlabel('Czas t');
            title({'eps=0.5'});
            axis([0 tk -3 3]);
        end
        x0 = 0;
        [TT,Y] = ode45(@(t, x) handle(t,x, epsilon), [t0,tk], x0);
        plot(TT, Y, 'c');
        x0 = 2;
        [TT,Y] = ode45(@(t, x) handle(t,x, epsilon), [t0,tk], x0);
        plot(TT, Y, 'c');
        hold off;
        % jak widac w punkcie x0 = 0 mamy stabilny lokalnie punkt
        % rownowagi, a w punkcie x0 = 2 mamy niestabilny punkt rownowagi,
        % poniewaz w 0 inne trajektorie zbiegaja do tej wartosci, gdzie w
        % x0 = 2 wartosci te nie zbiegaja a wrecz uciekaja
        
        %Przyklad 2:
        
        handle = @function_handle2;
        
        figure;
        hold on;
        for i=-2:0.5:2
            for j=-2:0.5:2
                x0=[i,j];
                plot3(0,i,j,'o');
                [TT,Y]=ode45(handle,[t0, tk], x0);
                plot3(TT, Y(:,1), Y(:,2), 'r');
            end
        end
        x0 = [0,0];
        [TT,Y] = ode45(handle, [t0, tk], x0);
        plot3(TT, Y(:,1), Y(:,2), 'c');
        hold off;
        axis([0 tk -2 2 -2 2]);
        
        %Przyk?ad 3:
        
        handle = @function_handle3;
        
        figure;
        hold on;
        for i=-2:0.5:2
            for j=-2:0.5:2
                x0=[i,j];
                plot3(0,i,j,'o');
                [TT,Y]=ode45(handle,[t0, tk], x0);
                plot3(TT, Y(:,1), Y(:,2), 'r');
            end
        end
        x0 = [0,0];
        [TT,Y] = ode45(handle, [t0, tk], x0);
        plot3(TT, Y(:,1), Y(:,2), 'c');
        x0 = [-2/3,0];
        [TT,Y] = ode45(handle, [t0, tk], x0);
        plot3(TT, Y(:,1), Y(:,2), 'c');
        hold off;
        axis([0 tk -2 2 -2 2]);
        
    case 2
        clear;
        %  Na podstawie przyk?adu 1 zanalizowa? wp?yw warto?ci epsilon na rozmiar otoczenia, w kt�rym
        %  dynamiki systemu zlienaryzowanego i nieliniowego s? podobne;

        
        
    case 3
        clear;
        %  Na podstawie przyk?adu 2 zweryfikowa? wp?yw braku hiperboliczno?ci;
        
        
    case 4
        clear;
        %  Na podstawie przyk?adu 3 pokaza? dzia?anie Tw. Grobmana Hartmana - por�wnuj?c
        %  portret fazowy systemu nieliniowego i jego linearyzacji w obydwu punktach r�wnowagi.

        
        
end

