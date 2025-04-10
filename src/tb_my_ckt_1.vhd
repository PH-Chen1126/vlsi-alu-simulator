library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_my_ckt_1 is
end tb_my_ckt_1;

architecture behavior of tb_my_ckt_1 is

    -- Component declaration for the Unit Under Test (UUT)
    component my_ckt_1
        Port (
            A : in  STD_LOGIC_VECTOR(7 downto 0);
            B : in  STD_LOGIC_VECTOR(7 downto 0);
            S : in  STD_LOGIC_VECTOR(1 downto 0);
            Y : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- Testbench signals
    signal A : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal S : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
    signal Y : STD_LOGIC_VECTOR(15 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: my_ckt_1 port map (
        A => A,
        B => B,
        S => S,
        Y => Y
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Mode 00: A OR B
        A <= "00001111"; B <= "11110000"; S <= "00";
        wait for 10 ns;

        -- Mode 01: A * B
        A <= "00000101"; B <= "00000011"; S <= "01"; -- 5*3 = 15
        wait for 10 ns;

        -- Mode 10: A + B
        A <= "00000011"; B <= "00000010"; S <= "10"; -- 3+2 = 5
        wait for 10 ns;

        -- Mode 11: A mod B
        A <= "00000101"; B <= "00000011"; S <= "11"; -- 5 mod 3 = 2
        wait for 10 ns;

        -- Mode 11: A mod B (B = 0) ¡÷ expect 0
        A <= "00000101"; B <= "00000000"; S <= "11";
        wait for 10 ns;

        wait;
    end process;

end behavior;
