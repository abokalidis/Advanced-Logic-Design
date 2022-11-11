-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT CLA_4bit_ADDER
          PORT(
                  Cin : IN std_logic;
                  A : IN std_logic_vector(3 downto 0);       
                  B : IN std_logic_vector(3 downto 0);
						S : OUT std_logic_vector(3 downto 0);
						C3: OUT std_logic
                  );
          END COMPONENT;

          SIGNAL A :  std_logic_vector(3 downto 0) :=  (others=>'0');
          SIGNAL B :  std_logic_vector(3 downto 0) :=  (others=>'0');
			 SIGNAL Cin :  std_logic:= '0';
			 SIGNAL S: std_logic_vector(3 downto 0);
			 SIGNAL C3: std_logic;
          

  BEGIN

  -- Component Instantiation
          uut: CLA_4bit_ADDER PORT MAP(
                  A => A,
                  B => B,
						Cin => Cin,
						S => S,
						C3 => C3
          );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN
	     A(0)<='1';
		  A(1)<='0';
		  A(2)<='1';
		  A(3)<='0';
		  
		  B(0)<='1';
		  B(1)<='1';
		  B(2)<='0';
		  B(3)<='0';
		  
		  Cin<='0';
        wait for 100 ns;
		  
		  A(0)<='1';
		  A(1)<='0';
		  A(2)<='0';
		  A(3)<='1';
		  
		  B(0)<='0';
		  B(1)<='0';
		  B(2)<='1';
		  B(3)<='0';
		  
		  Cin<='1';
        wait for 100 ns;
		  
		  A(0)<='0';
		  A(1)<='1';
		  A(2)<='0';
		  A(3)<='0';
		  
		  B(0)<='1';
		  B(1)<='0';
		  B(2)<='1';
		  B(3)<='1';
		  
		  Cin<='0';
        wait for 100 ns;
		  
		  A(0)<='1';
		  A(1)<='1';
		  A(2)<='1';
		  A(3)<='0';
		  
		  B(0)<='1';
		  B(1)<='0';
		  B(2)<='1';
		  B(3)<='1';
		  
		  Cin<='0';
        wait for 100 ns;

        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
