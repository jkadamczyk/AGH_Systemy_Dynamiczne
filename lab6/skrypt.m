%Jakub Adamczyk

%Wyb�r konkretnego zadania ze sprawozdania:
choice = menu('Wybierz, zadanie:', 'Zadanie 1 Symulacja Lorenz Van Der Pol', 'Zadanie 2 System Lorenza dla roznych epsilon', 'Zadanie 3 ax-x3', 'Zadanie 4 Ciekawe przypadki');

switch choice
    %zadanie 1
    case 1
        clear;
        
        %deklaracja epsilona do funkcji symulujacej oscylatpor Van der Pola
        
        epsilon = 1;
        
        %Warunki poczatkowe
        init_cond_1=[ linspace(-5, 5, 45); linspace(-5, 5, 45)];
        % czas poczatkowy, koncowy i przedzial miedzy kolejnymi czasami
        t_0 = 0;
        t_k = 10;
        t_skok = 1/50;

        figure;
        hold on;
        for i=1:length(init_cond_1)
            X(:,1)=init_cond_1(:,i);
            T(1)=t_0;
            for j=1:t_k/t_skok + 1
                X(:,j+1)=X(:,j) + t_skok * feval(@handle_vanderpol ,X(:,j), epsilon);
                T(j+1) = t_0 + t_skok * (j);
            end
            plot(X(1,:),X(2,:), 'b');
        end
        axis([-5 5 -5 5]);       % ustawienie parametrow wykresu
        title('Oscylator Van der Pola');
        xlabel('x1');
        ylabel('x2');
        hold off;
        
        % symalacja dla systemu lorenza
        clear;
        
        figure;
        hold on;
        
        % wartosci czasowe
        t_0 = 0;
        t_k = 10;
        t_skok = 1/100;
        
        % zmienne do wzoru
        ro = 10;
        b = 8/3;
        r = 28;
        
        %rysowanie wykres�w
        X(:,1) = [1;2;20];
        T(1)=t_0;
        for j=1:t_k/t_skok + 1
            X(:,j+1)=X(:,j) + t_skok * feval(@handle_lorenz ,X(:,j), ro, r, b);
            T(j+1) = t_0 + t_skok * (j);
        end
        plot3(X(1,:),X(2,:),X(3,:),'b');
        
        %ustawienia wykresu
        axis([-20 20 -20 20 0 40]);
        title('System Lorenza, efekt motyla');
        view([1 -5 3]);
        hold off;

    %zadanie 2
    case 2
        clear;
        
        %Warunki poczatkowe
        init_cond_1=[ linspace(-5, 5, 45); linspace(-5, 5, 45)];
        % czas poczatkowy, koncowy i przedzial miedzy kolejnymi czasami
        t_0 = 0;
        t_k = 10;
        t_skok = 1/50;
        
        %wektor z kolejnymi epsilonami
        epsilon = [-40, -5, -1, 0, 1, 3, 5, 50];

        for k=1:length(epsilon)
            figure;
            hold on;
            for i=1:length(init_cond_1)
                X(:,1)=init_cond_1(:,i);
                T(1)=t_0;
                for j=1:t_k/t_skok + 1
                    X(:,j+1)=X(:,j) + t_skok * feval(@handle_vanderpol ,X(:,j), epsilon(k));
                    T(j+1) = t_0 + t_skok * (j);
                end
                plot(X(1,:),X(2,:), 'b');
            end
            axis([-5 5 -5 5]);       % ustawienie parametrow wykresu
            title(strcat('epsilon = ', num2str(epsilon(k))));
            xlabel('x1');
            ylabel('x2');
            hold off;
        end
        
    %Zadanie 3
    case 3
        clear;
        
        figure;
        title('Zaleznosc pkt. rownowagi od a');
        hold on;
        line([-5 5], [0 0]);
        plot(0:0.1:5,sqrt(0:0.1:5), 'r');
        plot(0:0.1:5,-sqrt(0:0.1:5), 'g');
        axis([-5 5 -5 5]);
        xlabel('a');
        ylabel('x');
        hold off;
        
    %Zadanie 4
    case 4
        clear;
        % wartosci czasowe
        t_0 = 0;
        t_k = 10;
        t_skok = 1/100;
        
        % Ciekawy Przypadek 1
        ro=-2;
        b=5;
        r=20;
        
        figure;
        hold on;
        X(:,1) = [1;1;20];
        T(1)=t_0;
        for j=1:t_k/t_skok + 1
            X(:,j+1)=X(:,j) + t_skok * feval(@handle_lorenz ,X(:,j), ro, r, b);
            T(j+1) = t_0 + t_skok * (j);
        end
        plot3(X(1,:),X(2,:),X(3,:),'b');
       
        %ustawienia wykresu
        title('Ciekawy Lorenz 1');
        view([1 -5 3]);
        hold off;
        
        % Ciekawy przypadek 1
        ro=-10;
        b=100;
        r=50;
        
        figure;
        hold on;
        X(:,1) = [1;1;20];
        T(1)=t_0;
        for j=1:t_k/t_skok + 1
            X(:,j+1)=X(:,j) + t_skok * feval(@handle_lorenz ,X(:,j), ro, r, b);
            T(j+1) = t_0 + t_skok * (j);
        end
        plot3(X(1,:),X(2,:),X(3,:),'b');
       
        %ustawienia wykresu
        title('Ciekawy Lorenz 2');
        view([1 -5 3]);
        hold off;
        
        % Ciekawy przypadek 3
        ro=-1;
        b=0.5;
        r=50;
        
        figure;
        hold on;
        X(:,1) = [1;1;20];
        T(1)=t_0;
        for j=1:t_k/t_skok + 1
            X(:,j+1)=X(:,j) + t_skok * feval(@handle_lorenz ,X(:,j), ro, r, b);
            T(j+1) = t_0 + t_skok * (j);
        end
        plot3(X(1,:),X(2,:),X(3,:),'b');
       
        %ustawienia wykresu
        title('Ciekawy Lorenz 3');
        view([1 -5 3]);
        hold off;
        
end