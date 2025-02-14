library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_top is
  port(
    -- 外部 pad 端口（注意均定义为 inout，以便与 pad 单元连接）
    clk_pad         : inout std_logic;
    rst_pad         : inout std_logic;
    cs_n_pad        : inout std_logic;
    start_in_pad    : inout std_logic;
    valid_input_pad : inout std_logic;
    X_load_pad      : inout std_logic_vector(7 downto 0);
    ry_pad          : inout std_logic;
    read_data_pad   : inout std_logic_vector(8 downto 0);
    finish_pad      : inout std_logic
  );
end top_top;

architecture STRUCTURAL of top_top is

  ------------------------------------------------------------------
  -- Pad组件声明
  ------------------------------------------------------------------
  component CPAD_S_74x50u_IN    -- 输入 pad
    port (
      COREIO : out std_logic;
      PADIO  : in  std_logic
    );
  end component;

  component CPAD_S_74x50u_OUT   -- 输出 pad
    port (
      COREIO : in std_logic;
      PADIO  : out std_logic
    );
  end component;

  ------------------------------------------------------------------
  -- 内部设计模块声明
  ------------------------------------------------------------------
  component controller
    port (
      clk           : in  std_logic;
      rst           : in  std_logic;
      start_in      : in  std_logic;
      ALU_done      : in  std_logic;
      web           : out std_logic;
      xload_done    : out std_logic;
      ALU_en        : out std_logic;
      input_load_en : out std_logic;
      finish        : out std_logic
    );
  end component;

  component logic_top
    port (
      clk           : in  std_logic;
      rst           : in  std_logic;
      cs_n          : in  std_logic;
      ALU_en        : in  std_logic;
      X_load        : in  std_logic_vector(7 downto 0);
      valid_input   : in  std_logic;
      input_load_en : in  std_logic;
      web           : in  std_logic;
      xload_done    : out std_logic;
      ry            : out std_logic;
      read_data     : out std_logic_vector(8 downto 0);
      ALU_done      : out std_logic
    );
  end component;

  ------------------------------------------------------------------
  -- 内部互联信号
  ------------------------------------------------------------------
  signal clk_core, rst_core, cs_n_core, start_in_core, valid_input_core : std_logic;
  signal ry_core, finish_core, ALU_done, xload_done, ALU_en, input_load_en, web : std_logic;
  signal X_load_core     : std_logic_vector(7 downto 0);
  signal read_data_core  : std_logic_vector(8 downto 0);

begin

  ------------------------------------------------------------------
  -- 输入端 pad 实例化
  ------------------------------------------------------------------
  clk_pad_inst : CPAD_S_74x50u_IN
    port map (
      COREIO => clk_core,
      PADIO  => clk_pad
    );

  rst_pad_inst : CPAD_S_74x50u_IN
    port map (
      COREIO => rst_core,
      PADIO  => rst_pad
    );

  cs_n_pad_inst : CPAD_S_74x50u_IN
    port map (
      COREIO => cs_n_core,
      PADIO  => cs_n_pad
    );

  start_in_pad_inst : CPAD_S_74x50u_IN
    port map (
      COREIO => start_in_core,
      PADIO  => start_in_pad
    );

  valid_input_pad_inst : CPAD_S_74x50u_IN
    port map (
      COREIO => valid_input_core,
      PADIO  => valid_input_pad
    );

  X_load_pad_inst : for i in X_load_pad'range generate
    X_load_pad_gen : CPAD_S_74x50u_IN
      port map (
        COREIO => X_load_core(i),
        PADIO  => X_load_pad(i)
      );
  end generate;

  ------------------------------------------------------------------
  -- 输出端 pad 实例化
  ------------------------------------------------------------------
  ry_pad_inst : CPAD_S_74x50u_OUT
    port map (
      COREIO => ry_core,
      PADIO  => ry_pad
    );

  read_data_pad_inst : for i in read_data_pad'range generate
    read_data_pad_gen : CPAD_S_74x50u_OUT
      port map (
        COREIO => read_data_core(i),
        PADIO  => read_data_pad(i)
      );
  end generate;

  finish_pad_inst : CPAD_S_74x50u_OUT
    port map (
      COREIO => finish_core,
      PADIO  => finish_pad
    );

  ------------------------------------------------------------------
  -- 模块实例化
  ------------------------------------------------------------------
  controller_inst : controller
    port map (
      clk           => clk_core,
      rst           => rst_core,
      start_in      => start_in_core,
      ALU_done      => ALU_done,
      web           => web,
      xload_done    => xload_done,
      ALU_en        => ALU_en,
      input_load_en => input_load_en,
      finish        => finish_core
    );

  logic_top_inst : logic_top
    port map (
      clk           => clk_core,
      rst           => rst_core,
      cs_n          => cs_n_core,
      ALU_en        => ALU_en,
      X_load        => X_load_core,
      valid_input   => valid_input_core,
      input_load_en => input_load_en,
      web           => web,
      xload_done    => xload_done,
      ry            => ry_core,
      read_data     => read_data_core,
      ALU_done      => ALU_done
    );

end STRUCTURAL;
