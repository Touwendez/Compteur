entity Compteur_Sec_Min is
    Port ( CLK_1 : in  STD_LOGIC;
           RAZ : in  STD_LOGIC;
           ST : in  STD_LOGIC;
           sec : out  integer range 0 to 59;
           min : out  integer range 0 to 59);
end Compteur_Sec_Min;

architecture Behavioral of Compteur_Sec_Min is
    signal count_sec : integer range 0 to 59 := 0;
    signal count_min : integer range 0 to 59 := 0;
begin
    process (CLK_1, RAZ, ST)
    begin
        if RAZ = '1' then
            count_sec <= 0;
            count_min <= 0;
        elsif rising_edge(CLK_1) then
            if ST = '1' then
                count_sec <= count_sec + 1;
                if count_sec = 60 then
                    count_sec <= 0;
                    count_min <= count_min + 1;
                    if count_min = 60 then
                        count_min <= 0;
                    end if;
                end if;
            end if;
        end if;
    end process;
    
    sec <= count_sec;
    min <= count_min;
end Behavioral;
