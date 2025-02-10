CREATE TABLE IF NOT EXISTS recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    instructions TEXT,
    category VARCHAR(50),
    image_url VARCHAR(255)
);

INSERT INTO recipes (title, description, instructions, category, image_url)
VALUES
('Pasta al Pomodoro', 'Una ricetta classica italiana.', '1. Cuoci la pasta\n2. Prepara il sugo\n3. Mescola', 'Primi', 'https://via.placeholder.com/150');
