USE Biomedical;

INSERT INTO Publisher (Publisher_ID, Name) VALUES 
(1, 'Elsevier'),
(2, 'Springer Nature'),
(3, 'Wiley');

INSERT INTO Journal (ISSN, Name, Impact_Factor, Quarter, Country, Start_Date, Pub_Rate, Is_Open_Access, Publisher_ID) VALUES 
(1234567, 'Nature Medicine', 42.5, 'Q1', 'USA', '1995-01-01', 'Monthly', FALSE, 2),
(7654321, 'The Lancet', 45.4, 'Q1', 'UK', '1823-10-05', 'Monthly', FALSE, 1),
(1122334, 'BMC Bioinformatics', 3.2, 'Q2', 'UK', '2000-01-01', 'Annually', TRUE, 2);

INSERT INTO Author (Author_ID, Name, Qualification, Affiliation, Job_Title, Email, H_Index) VALUES 
(1, 'Dr. Ahmed Ali', 'PhD in Bioinformatics', 'Cairo University', 'Professor', 'ahmed@example.com', 15),
(2, 'Dr. Sara Smith', 'MD', 'Harvard Medical School', 'Researcher', 'sara@example.com', 25),
(3, 'Prof. John Doe', 'PhD in Genetics', 'Oxford University', 'Senior Lecturer', 'john@example.com', 30);

INSERT INTO Research (Research_ID, Title, Pub_Date, Abstract, Journal_ISSN) VALUES 
(1, 'CRISPR Applications in Medicine', '2025-05-10', 'A review of modern CRISPR techniques.', 1234567),
(2, 'Machine Learning in Cancer Detection', '2024-11-20', 'Using AI to detect early stages of cancer.', 1122334),
(3, 'COVID-19 Long-Term Effects', '2023-03-15', 'Study on the long term effects of COVID-19 on patients.', 7654321);
