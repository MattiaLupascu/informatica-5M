import sqlite3


def crea_tabella():
    with sqlite3.connect("persone.db") as conn:
        c = conn.cursor()
        c.execute("""
            CREATE TABLE IF NOT EXISTS Persona (
                nome TEXT,
                eta INTEGER,
                citta TEXT,
                PRIMARY KEY(nome)
            )
        """)
        conn.commit()


def inserisci_dati():
    with sqlite3.connect("persone.db") as conn:
        c = conn.cursor()
        persone = [("Mario", 30, "Roma"), ("Luigi", 25, "Milano"), ("Anna", 22, "Roma")]
        c.executemany("INSERT INTO Persona (nome, eta, citta) VALUES (?, ?, ?)", persone)
        conn.commit()


def tutte_le_persone():
    with sqlite3.connect("persone.db") as conn:
        c = conn.cursor()
        c.execute("SELECT * FROM Persona")
        persone = c.fetchall()
        for persona in persone:
            print(persona)

def persone_per_citta(citta):
    with sqlite3.connect("persone.db") as conn:
        c = conn.cursor()
        # c.execute("SELECT * FROM Persona WHERE citta = (?)", citta)
        c.execute("SELECT * FROM Persona WHERE citta = ?", (citta,))
        persone = c.fetchall()
        for persona in persone:
            print(persona)

def aggiorna_eta(nome,eta):
    with sqlite3.connect("persone.db") as conn:
        c = conn.cursor()
        c.execute("UPDATE Persona SET eta = ?",(eta,),"WHERE nome = ?",(nome,))
        persone = c.fetchall()
        for persona in persone:
            print(persona)

# Creazione del database e della tabella
crea_tabella()

# Inserimento dei dati di esempio
#inserisci_dati()

# Esempio di utilizzo
tutte_le_persone()

persone_per_citta("Roma")

aggiorna_eta("Mario",35)