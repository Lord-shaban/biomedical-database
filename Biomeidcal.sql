create database Biomedical;
use Biomedical;
create table Publisher (
    Publisher_ID int not null,
    Name varchar(100) not null,
    primary key (Publisher_ID)
);

create table Journal (
    ISSN int not null,
    Name varchar(100) not null,
    Impact_Factor float (10),
    Quarter varchar(2),
    Country varchar(100),
    Start_Date date,
    Pub_Rate enum('Monthly', 'Quarterly', 'Annually'),
    Is_Open_Access boolean,
    Publisher_ID int,
    primary key (ISSN),
    foreign key (Publisher_ID) references Publisher (Publisher_ID)
);

create table Author (
    Author_ID int not null,
    Name varchar(100) not null,
    Qualification varchar(100),
    Affiliation varchar(100),
    Job_Title varchar(100),
    Email varchar(100),
    H_Index INT,
    primary key (Author_ID)
);

CREATE TABLE Research (
    Research_ID int not null,
    Title varchar(100) not null,
    Pub_Date DATE,
    Abstract varchar(100),
    Journal_ISSN int,
    primary key (Research_ID),
    FOREIGN KEY (Journal_ISSN) REFERENCES Journal(ISSN)
);

CREATE TABLE Author_Interests (
    Author_ID INT,
    Field_Name VARCHAR(100),
    PRIMARY KEY (Author_ID, Field_Name),
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID) ON DELETE CASCADE
);

CREATE TABLE Biomedical_Fields (
    Research_ID INT,
    Field_Name VARCHAR(100),
    PRIMARY KEY (Research_ID, Field_Name),
    FOREIGN KEY (Research_ID) REFERENCES Research(Research_ID) ON DELETE CASCADE
);

CREATE TABLE Research_Authors (
    Research_ID INT,
    Author_ID INT,
    Author_Order INT,
    PRIMARY KEY (Research_ID, Author_ID),
    FOREIGN KEY (Research_ID) REFERENCES Research(Research_ID) ON DELETE CASCADE,
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID) ON DELETE CASCADE
);

CREATE TABLE Citations (
    Citing_Research_ID INT,
    Cited_Research_ID INT,
    PRIMARY KEY (Citing_Research_ID, Cited_Research_ID),
    FOREIGN KEY (Citing_Research_ID) REFERENCES Research(Research_ID) ON DELETE CASCADE,
    FOREIGN KEY (Cited_Research_ID) REFERENCES Research(Research_ID) ON DELETE CASCADE
);

CREATE TABLE Publisher_Payment (
    Publisher_ID INT,
    Method VARCHAR(50),
    PRIMARY KEY (Publisher_ID, Method),
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID) ON DELETE CASCADE
);

CREATE TABLE Publisher_Type (
    Publisher_ID INT,
    Pub_Type VARCHAR(50),
    PRIMARY KEY (Publisher_ID, Pub_Type),
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID) ON DELETE CASCADE
);

CREATE TABLE Author_Interests (
    Author_ID INT,
    Field_Name VARCHAR(100),
    PRIMARY KEY (Author_ID, Field_Name),
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID) ON DELETE CASCADE
);

CREATE TABLE Biomedical_Fields (
    Research_ID INT,
    Field_Name VARCHAR(100),
    PRIMARY KEY (Research_ID, Field_Name),
    FOREIGN KEY (Research_ID) REFERENCES Research(Research_ID) ON DELETE CASCADE
);

CREATE TABLE Research_Authors (
    Research_ID INT,
    Author_ID INT,
    Author_Order INT,
    PRIMARY KEY (Research_ID, Author_ID),
    FOREIGN KEY (Research_ID) REFERENCES Research(Research_ID) ON DELETE CASCADE,
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID) ON DELETE CASCADE
);

CREATE TABLE Citations (
    Citing_Research_ID INT,
    Cited_Research_ID INT,
    PRIMARY KEY (Citing_Research_ID, Cited_Research_ID),
    FOREIGN KEY (Citing_Research_ID) REFERENCES Research(Research_ID) ON DELETE CASCADE,
    FOREIGN KEY (Cited_Research_ID) REFERENCES Research(Research_ID) ON DELETE CASCADE
);

CREATE TABLE Publisher_Payment (
    Publisher_ID INT,
    Method VARCHAR(50),
    PRIMARY KEY (Publisher_ID, Method),
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID) ON DELETE CASCADE
);

CREATE TABLE Publisher_Type (
    Publisher_ID INT,
    Pub_Type VARCHAR(50),
    PRIMARY KEY (Publisher_ID, Pub_Type),
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID) ON DELETE CASCADE
);


INSERT INTO Publisher (Publisher_ID, Name) VALUES 
(1, 'Nature Portfolio'), 
(2, 'Elsevier'), 
(3, 'Cell Press'), 
(4, 'Frontiers Media'),
(5, 'Springer Nature'),
(6, 'Wiley-Blackwell'),
(7, 'BMJ Publishing Group'),
(8, 'SAGE Publications'),
(9, 'Taylor & Francis'),
(10, 'American Chemical Society'),
(11, 'The Lancet Publishing Group'),
(12, 'MDPI'),
(13, 'PLOS (Public Library of Science)'),
(14, 'Karger Publishers');

INSERT INTO Journal (ISSN, Name, Impact_Factor, Quarter, Country, Start_Date, Pub_Rate, Is_Open_Access, Publisher_ID) VALUES 
(14764687, 'Nature', 64.8, 'Q1', 'UK', '1869-11-04', 'Monthly', FALSE, 1),
(00928674, 'Cell', 66.8, 'Q1', 'USA', '1974-01-01', 'Monthly', FALSE, 3),
(16643224, 'Frontiers in Immunology', 7.3, 'Q2', 'Switzerland', '2010-05-22', 'Monthly', TRUE, 5),
(01406736, 'The Lancet', 168.9, 'Q1', 'UK', '1823-10-05', 'Monthly', FALSE, 12),
(15457885, 'PLOS Biology', 9.8, 'Q1', 'USA', '2003-10-13', 'Monthly', TRUE, 14),
(20726694, 'Cancers', 5.2, 'Q2', 'Switzerland', '2009-09-01', 'Monthly', TRUE, 13),
(09598138, 'BMJ (British Medical Journal)', 105.7, 'Q1', 'UK', '1840-10-03', 'Monthly', FALSE, 8),
(14338351, 'Medical Microbiology and Immunology', 4.5, 'Q2', 'Germany', '1886-01-01', 'Quarterly', FALSE, 6),
(00225347, 'The Journal of Urology', 6.6, 'Q1', 'USA', '1917-01-01', 'Monthly', FALSE, 2),
(17594774, 'Nature Reviews Clinical Oncology', 78.8, 'Q1', 'UK', '2004-11-01', 'Monthly', FALSE, 1),
(00062910, 'Biochemical and Biophysical Research Communications', 3.1, 'Q3', 'USA', '1959-01-01', 'Monthly', FALSE, 2),
(14220067, 'International Journal of Molecular Sciences', 5.6, 'Q2', 'Switzerland', '2000-01-01', 'Monthly', TRUE, 13),
(00219258, 'Journal of Biological Chemistry', 4.8, 'Q2', 'USA', '1905-10-01', 'Monthly', TRUE, 2);

INSERT INTO Author (Author_ID, Name, Qualification, Affiliation, Job_Title, Email, H_Index) VALUES 
(1, 'Ahmed Mansour', 'PhD', 'Cairo University', 'Professor', 'a.mansour@cairo.edu', 45),
(2, 'Sarah Jenkins', 'PhD', 'MIT', 'Senior Researcher', 'sjenkins@mit.edu', 32),
(3, 'Li Wei', 'MSc', 'Tsinghua University', 'Lab Manager', 'l.wei@tsinghua.edu.cn', 12),
(4, 'Elena Rossi', 'PhD', 'University of Milan', 'Associate Professor', 'e.rossi@unimi.it', 28),
(5, 'Omar Zaid', 'PhD', 'Alexandria University', 'Postdoc', 'o.zaid@alex.edu.eg', 8),
(6, 'Dr. Layla Hassan', 'PhD', 'Alexandria University', 'Professor of Oncology', 'l.hassan@alexu.edu.eg', 42),
(7, 'Dr. Robert Miller', 'MD, PhD', 'Johns Hopkins Medicine', 'Clinical Researcher', 'rmiller@jhu.edu', 68),
(8, 'Dr. Yuki Tanaka', 'PhD', 'University of Tokyo', 'Postdoctoral Fellow', 'y.tanaka@u-tokyo.ac.jp', 15),
(9, 'Dr. Sofia Rodriguez', 'PhD', 'University of Barcelona', 'Associate Professor', 's.rodriguez@ub.edu', 31),
(10, 'Dr. Kwame Boateng', 'PhD', 'University of Ghana', 'Head of Department', 'k.boateng@ug.edu.gh', 24),
(11, 'Dr. Alice Dubois', 'PhD', 'Pasteur Institute', 'Senior Scientist', 'a.dubois@pasteur.fr', 55),
(12, 'Dr. Marcus Thorne', 'MD', 'Stanford University', 'Surgical Resident', 'mthorne@stanford.edu', 9),
(13, 'Dr. Priya Sharma', 'PhD', 'IISc Bangalore', 'Research Lead', 'p.sharma@iisc.ac.in', 37),
(14, 'Dr. Hans Schmidt', 'PhD', 'Max Planck Institute', 'Principal Investigator', 'h.schmidt@mpg.de', 82);

INSERT INTO Research (Research_ID, Title, Pub_Date, Abstract, Journal_ISSN) VALUES 
(101, 'Nanoparticle Delivery in Cancer Immunotherapy', '2025-03-12', 'Exploring the use of polymeric nanoparticles to deliver mRNA vaccines for melanoma treatment.', 16643224),
(102, 'Kinetics of Bacterial Enzymes in Fiber Extraction', '2025-06-20', 'A study on the enzymatic breakdown of lignocellulose in halophytic plants for sustainable textiles.', 16643224),
(103, 'CRISPR-Cas9 Applications in Genetic Disorders', '2025-09-05', 'Comprehensive review of gene editing safety in clinical trials for sickle cell anemia.', 15457885),
(104, 'Microbial Bioprocessing of Salt Marsh Bacteria', '2026-01-15', 'Isolating extremophiles from northern Egyptian salt marshes for industrial bioremediation.', 17594774),
(105, 'Biostatistics in Modern Drug Discovery', '2026-04-02', 'The role of large-scale data analysis in identifying protein-ligand binding affinities.', 00219258),
(106, 'Amyloid-beta Aggregation in Alzheimers Disease', '2024-05-12', 'This study investigates the structural dynamics of amyloid-beta plaque.', 00219258),
(107, 'Phase III Trial of New mRNA Malaria Vaccine', '2023-08-20', 'Reporting the efficacy and safety profiles of the R21/Matrix-M vaccine in pediatric populations.', 00219258),
(108, 'Bacterial Bioprocessing of Halophytic Fibers', '2025-02-14', 'Exploring the use of salt-tolerant bacterial enzymes for the sustainable fibers.', 15457885),
(109, 'Nanoparticle-mediated Drug Delivery in Glioblastoma', '2024-11-30', 'Evaluation of polymeric nanoparticles to bypass the blood-brain barrier for targeted chemotherapy.', 20726694),
(110, 'The Role of IL-6 in Cytokine Release Syndrome', '2023-03-22', 'A molecular analysis of interleukins during CAR-T cell therapy and the impact of Tocilizumab.', 00219258),
(111, 'Structural Biology of the SARS-CoV-2 Spike Protein', '2022-12-01', 'Deciphering the conformational changes of the RBD during viral entry into human ACE2 receptors.', 00062910),
(112, 'Gut-Brain Axis: Influence of Microbiota on Anxiety', '2025-03-10', 'Longitudinal study on how specific probiotic strains modulate neurotransmitter levels.', 00928674),
(113, 'Genetic Markers for Salinity Tolerance in Rice', '2024-07-18', 'Identifying Quantitative Trait Loci associated with sodium exclusion in Egyptian rice cultivars.', 00062910),
(114, 'Advancements in Non-invasive Prenatal Testing', '2023-06-05', 'Comparison of sequencing depths for detecting chromosomal microdeletions in cell-free DNA.', 20726694);

use biomedical;
INSERT INTO Author_Interests (Author_ID, Field_Name) VALUES 
(1, 'Biotechnology'), 
(1, 'Microbiology'), 
(1, 'Environmental Science'),
(5, 'Oncology'), 
(5, 'Nanomedicine'),
(6, 'Immunology'), 
(6, 'Internal Medicine'),
(10, 'Virology'), 
(10, 'Molecular Biology'),
(13, 'Neuroscience'), 
(13, 'Biochemistry'),
(14, 'Biostatistics'), 
(11, 'Biophysics'),
(14, 'Bioinformatics');

INSERT INTO Biomedical_Fields (Research_ID, Field_Name) VALUES 
(101, 'Genetics'), 
(102, 'Biotechnology'),
(103, 'Neurology'), 
(104, 'Biochemistry'),
(105, 'Industrial Microbiology'), 
(106, 'Bioprocessing'),
(107, 'Nanotechnology'), 
(108, 'Pharmacology'),
(109, 'Agricultural Biotechnology'), 
(110, 'Botany'),
(111, 'Physiology'), 
(112, 'Gerontology'),
(113, 'Microbial Physiology'),
(114, 'Molecular Genetics');

INSERT INTO Publisher_Payment (Publisher_ID, Method) VALUES 
(2, 'Bank Transfer'), 
(2, 'Cash'),
(3, 'Online Payment'), 
(3, 'Bank Transfer'),
(4, 'Online Payment'), 
(4, 'Bank Transfer'), 
(4, 'Cash'),
(5, 'Bank Transfer'),
(9, 'Online Payment'), 
(9, 'Bank Transfer'),
(10, 'Online Payment'), 
(10, 'Bank Transfer'),
(11, 'Cash'),
(12, 'Bank Transfer');

INSERT INTO Publisher_Type (Publisher_ID, Pub_Type) VALUES 
(2, 'Journals'), 
(2, 'Databases'),
(4, 'Journals'), 
(4, 'ebooks'), 
(5, 'Journals'), 
(5, 'Conference Proceedings'),
(8, 'Journals'), 
(8, 'Clinical Guidelines'),
(9, 'Journals'), 
(9, 'Books'),
(12, 'Journals'), 
(12, 'Digital Archives'),
(14, 'Journals'), 
(14, 'Preprints');

INSERT INTO Research_Authors (Research_ID, Author_ID, Author_Order) VALUES 
(101, 1, 1),   
(101, 4, 2),   
(101, 13, 3),
(102, 2, 1),
(104, 1, 2),  
(105, 10, 1),  
(105, 6, 2),   
(107, 5, 1),   
(107, 12, 2),  
(111, 1, 1),   
(111, 14, 2),  
(111, 9, 3), 
(113, 13, 1),
(113, 7, 2); 

INSERT INTO Citations (Citing_Research_ID, Cited_Research_ID) VALUES 
(101, 109),
(102, 108),
(103, 107),
(104, 113),
(105, 110),
(106, 111),
(107, 114),
(108, 102),
(109, 101),
(110, 105),
(111, 106),
(112, 113),
(113, 104),
(114, 103);
