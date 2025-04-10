library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity my_ckt_1 is
    Port (
        A : in  STD_LOGIC_VECTOR(7 downto 0);
        B : in  STD_LOGIC_VECTOR(7 downto 0);
        S : in  STD_LOGIC_VECTOR(1 downto 0);
        Y : out STD_LOGIC_VECTOR(15 downto 0)
    );
end my_ckt_1;

architecture Behavioral of my_ckt_1 is
    signal A_u, B_u : UNSIGNED(7 downto 0);
    signal Y_u : UNSIGNED(15 downto 0);
begin
    A_u <= UNSIGNED(A);
    B_u <= UNSIGNED(B);

    process(A_u, B_u, S)
    begin
        case S is
            when "00" =>  -- Mode 1: A OR B
                Y_u <= (others => '0');
                Y_u(7 downto 0) <= A_u or B_u;
            when "01" =>  -- Mode 2: A * B
                Y_u <= A_u * B_u;
            when "10" =>  -- Mode 3: A + B
                Y_u <= ("00000000" & A_u) + ("00000000" & B_u);
            when "11" =>  -- Mode 4: A mod B
                if B_u = 0 then
                    Y_u <= (others => '0');
                else
                    Y_u <= (others => '0');
                    Y_u(7 downto 0) <= A_u mod B_u;
                end if;
            when others =>
                Y_u <= (others => '0');
        end case;
    end process;

    Y <= STD_LOGIC_VECTOR(Y_u);
end Behavioral;
