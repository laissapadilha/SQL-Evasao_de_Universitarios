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

- **Marital Status (Estado Civil):** 1 – single (solteiro), 2 – married (casado), 3 – widower (viúvo),  4 – divorced (divorciado), 5 – facto union (união estável), 6 – legally separated (separado judicialmente);
- **Course (Curso):** 33 - Biofuel Production Technologies, 171 - Animation and Multimedia Design, 8014 - Social Service (evening attendance), 9003 - Agronomy, 9070 - Communication Design, 9085 - Veterinary Nursing, 9119 - Informatics Engineering, 9130 - Equinculture, 9147 - Management, 9238 - Social Service, 9254 - Tourism, 9500 - Nursing, 9556 - Oral Hygiene, 9670 - Advertising and Marketing Management, 9773 - Journalism and Communication, 9853 - Basic Education, 9991 - Management (evening attendance);
- **Daytime/evening attendance (Turno de estudo):** 1 – daytime (diurno), 0 - evening (noturno);
- **Tuition fees up to date (Mensalidade em dia):** 1 – yes (sim), 0 – no (não);
- **Gender (Gênero):** 1 – male (masculino), 0 – female (feminino);
- **Scholarship holder (Bolsista):** 1 – yes (sim), 0 – no (não);
- **Age at enrollment (Idade no momento da matrícula)**;
- **International (Estudante estrangeiro):** 1 – yes (sim), 0 – no (não);
- **Target:** classificação nas categorias dropout (evasão), enrolled (matriculado) e graduate (formado) ao final da duração normal do curso.

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

A maior taxa de evasão está entre os estudandes na faixa etária entre 30-39 anos, onde quase 56% dos estudantes desistem da graduação.

<img src="https://github.com/user-attachments/assets/d392d832-4c25-48d9-891b-d092357be1df" alt="image" width="60%">

### Taxa de evasão por turno de estudo

Embora a maioria dos estudantes optem pelo período diurno, a maior taxa de evasão estão no período noturno, alcançando mais de 42% dos estudanters deste turno.

<img src="https://github.com/user-attachments/assets/6b6f2b79-c074-43d0-b1b7-ab4f14b6a65e" alt="image" width="60%">

### Taxa de evasão por curso

Dos 17 cursos avaliados, 4 deles apresentam uma taxa de evasão maior de 50%, sendo que o curso Biofuel Production Technologies (Tecnologias de Produção de Biocombustíveis) supera a taxa de 66% de evasão.

<img src="https://github.com/user-attachments/assets/b2296648-4b22-4268-b4a1-3f69adf9eb80" alt="image" width="60%">
<img src="https://github.com/user-attachments/assets/4dbfe512-73d9-421d-a5a2-21582e87e307" alt="image" width="60%">

### Taxa de evasão estudantes estrangeiros, com mensalidades atrasadas e com bolsa de estudos

É possível identificar que a maior taxa de evasão está entre os estudantes não estrangeiros, que estão com as mensalidades atrasadas e não são bolsistas, atingindo 90% neste grupo,  seguida pelos estudantes estrangeiros que também estão com mensalidades atrasadas e não possuem bolsa, representado mais de 68%. A terceira posição é ocupada por estudantes não estrangeiros, com mensalidades atrasadas e bolsistas, com 62% de evasão.

<img src="https://github.com/user-attachments/assets/15510a27-bc98-49b3-99da-b670712f5d88" alt="image" width="85%">

## Considerações Finais

A análise realizada revelou importantes insights sobre os fatores associados à evasão de estudantes em cursos de graduação. Com uma taxa geral de evasão de 32,12%, observa-se que diversos aspectos, como estado civil, faixa etária, turno de estudo, curso e condições socioeconômicas, influenciam significativamente as desistências. Cabe destacar os seguintes pontos:

- A maior taxa de evasão está entre estudantes na faixa etária de 30-39 anos (quase 56%) e no turno noturno (42%), sugerindo que conciliar trabalho, vida pessoal e estudos pode ser um desafio significativo;
- Em relação ao estado civil, os legalmente separados apresentaram a maior taxa de evasão (67%), indicando possíveis dificuldades em lidar com situações familiares e acadêmicas simultaneamente;
- Cursos como **Biofuel Production Technologies** se destacaram negativamente, com mais de 66% de evasão, apontando para possíveis problemas estruturais ou desajuste entre expectativas e realidade;
- Fatores financeiros têm forte impacto, sendo que estudantes com mensalidades atrasadas e sem bolsa de estudos estão entre os grupos mais vulneráveis, alcançando 90% de evasão em alguns casos.

Esses resultados fornecem uma base sólida para desenvolver estratégias direcionadas à retenção de estudantes. Investir em apoio financeiro, ações específicas para estudantes mais velhos ou em turnos noturnos, e melhorias em cursos com altas taxas de evasão pode contribuir significativamente para reduzir o índice de desistências e promover maior sucesso acadêmico.

