# Análise da Evasão de Universitários

**Fonte dos Dados:** [Predict Students' Dropout and Academic Success](https://archive.ics.uci.edu/dataset/697/predict+students+dropout+and+academic+success)

## Introdução

A base de dados contém informações de uma instituição de ensino superior, referentes a estudantes de diversos cursos de graduação. Inclui dados coletados no momento da matrícula (como histórico acadêmico, características demográficas e fatores socioeconômicos), além do desempenho dos alunos ao final do primeiro e segundo semestres. A base é composta por 36 colunas, que trazem dados de 4.424 estudantes.

Por meio da análise dessa base, buscou-se identificar o perfil dos universitários que não concluem a graduação, bem como as possíveis causas da evasão.

## Importação para o Azure Data Studio

Primeiramente, foi criado um novo banco de dados "StudentsDropout" no Azure Data Studio. Após o download do arquivo .csv da fonte de dados, foi realizada a importação para o banco de dados criado por meio da extensão SQL Server Import, conforme imagem abaixo.

<img src="https://github.com/user-attachments/assets/7adabe17-2216-4b40-8840-3ca67bb882fb" alt="image" width="60%">

Todas as consultas realizadas podem ser consultadas [aqui](https://github.com/laissapadilha/SQL-Evasao_de_Universitarios/blob/main/StudentsDropout.sql).

## Dicionários das variáveis

Serão definidas a seguir apenas as variáveis utilizadas no estudo.

- **Marital Status:** 1 – single 2 – married 3 – widower 4 – divorced 5 – facto union 6 – legally separated;
- **Course:** 33 - Biofuel Production Technologies 171 - Animation and Multimedia Design 8014 - Social Service (evening attendance) 9003 - Agronomy 9070 - Communication Design 9085 - Veterinary Nursing 9119 - Informatics Engineering 9130 - Equinculture 9147 - Management 9238 - Social Service 9254 - Tourism 9500 - Nursing 9556 - Oral Hygiene 9670 - Advertising and Marketing Management 9773 - Journalism and Communication 9853 - Basic Education 9991 - Management (evening attendance);
- **Daytime/evening attendance:** 1 – daytime 0 - evening;
- **Tuition fees up to date:** 1 – yes 0 – no;
- **Gender:** 1 – male 0 – female;
- **Scholarship holder:** 1 – yes 0 – no;
- **Age at enrollment:** Age of studend at enrollment;
- **International:** 1 – yes 0 – no;
- **Target:** Target. The problem is formulated as a three category classification task (dropout, enrolled, and graduate) at the end of the normal duration of the course.

## Perfil dos estudantes que desistiram da graduação

Ao todo, observa-se que há 1.421 estudantes na base que desistiram da graduação.

Com base no gênero, estado civil e idade média apenas dos desistentes, buscou-se identificar o perfil destes estudantes. Percebe-se que mais de 80% dos desistentes são solteiros, não havendo diferença relevante entre os gêneros e nem na idade média neste estado civil.

<img src="https://github.com/user-attachments/assets/45f6c0fa-085b-453b-91d9-62efb56e18ca" alt="image" width="50%">

## Taxa de evasão

Ao realizar a comparação do total de estudantes desistentes com o total de matriculados, identifica-se que o percentual de evasão é de 32,12%. 

<img src="https://github.com/user-attachments/assets/4f805c3a-c6ce-4a8d-967f-0a1336d4d9ed" alt="image" width="60%">

A seguir, as taxas de evasão serão avaliadas considerando gênero, estado civil, faixa etária, turno de estudo, curso, nacionalidade, atraso de mensalidade e presença de bolsa de estudos.

### Taxa de evasão por gênero

Embora a quantidade de desistentes do gênero feminino seja maior do que do masculino, a diferença na taxa de evasão de estudantes do gênero masculino é superior em aproximadamente 20% quando comparamos com as estudantes do gênero feminino.

<img src="https://github.com/user-attachments/assets/01c26ab6-acc8-4a56-95bb-83fdb905454a" alt="image" width="60%">

### Taxa de evasão por estado civil

Apesar dos solteiros somarem a maior quantidade de desistentes, quando é avaliado percentual de evasão, a taxa é de 30%, inferior aos aprovimadamente 67% para os legamente separados, 47% para os divorciados e 46% para os casados.

<img src="https://github.com/user-attachments/assets/8a94fd68-456b-4f80-a07b-d969e6565e6a" alt="image" width="60%">

### Taxa de evasão por faixa etária

<img src="https://github.com/user-attachments/assets/a68c3a2f-b35d-476b-96dc-a6ca29792ae3" alt="image" width="60%">

### Taxa de evasão por turno de estudo

<img src="https://github.com/user-attachments/assets/6b6f2b79-c074-43d0-b1b7-ab4f14b6a65e" alt="image" width="60%">

### Taxa de evasão por curso

<img src="https://github.com/user-attachments/assets/b2296648-4b22-4268-b4a1-3f69adf9eb80" alt="image" width="60%">
<img src="https://github.com/user-attachments/assets/4dbfe512-73d9-421d-a5a2-21582e87e307" alt="image" width="60%">

### Taxa de evasão estudantes internacionais, com mensalidades atrasadas e com bolsa de estudos

<img src="https://github.com/user-attachments/assets/d38ad891-b435-4c06-bd9e-279bdcde73cd" alt="image" width="60%">

## Considerações Finais

