--Parametri pentru 'structura RECORD a conexiunii noastre'
TYPE connection IS RECORD(
    remote_host    VARCHAR2(255),
    remote_port    PLS_INTEGER,
    local_host     VARCHAR2(255),
    local_port     PLS_INTEGER,
    charset        VARCHAR2(30),
    newline        VARCHAR2(2),
    tx_timeout     PLS_INTEGER,
    private_sd     PLS_INTEGER);
/
UTL_TCP.OPEN_CONNECTION(
   remote_host     IN VARCHAR2,
   remote_port     IN PLS_INTEGER,
   local_host      IN VARCHAR2 DEFAULT NULL,
   local_port      IN PLS_INTEGER DEFAULT NULL,
   in_buffer_size  IN PLS_INTEGER DEFAULT NULL,
   out_buffer_size IN PLS_INTEGER DEFAULT NULL,
   charset         IN VARCHAR2 DEFAULT NULL,
   newline         IN VARCHAR2 DEFAULT CRLF,
   tx_timeout      IN PLS_INTEGER DEFAULT NULL,
   wallet_path     IN VARCHAR2 DEFAULT NULL,
   wallet_password IN VARCHAR2 DEFAULT NULL,
RETURN connection;