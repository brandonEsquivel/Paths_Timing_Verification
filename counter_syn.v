/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 6.2.0-11ubuntu1 -O2 -fdebug-prefix-map=/build/yosys-OIL3SR/yosys-0.7=. -fstack-protector-strong -fPIC -Os) */

(* top =  1  *)
(* src = "./src/counter.v:11" *)
module contador(ENABLE, RESET, clk, D, MODO, Q, RCO, LOAD);
  (* src = "./src/counter.v:33" *)
  wire _000_;
  (* src = "./src/counter.v:33" *)
  wire [3:0] _001_;
  (* src = "./src/counter.v:33" *)
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  (* src = "./src/counter.v:14" *)
  input [3:0] D;
  (* src = "./src/counter.v:13" *)
  input ENABLE;
  (* src = "./src/counter.v:18" *)
  output LOAD;
  (* src = "./src/counter.v:15" *)
  input [1:0] MODO;
  (* src = "./src/counter.v:23" *)
  wire [1:0] MODO_reg;
  (* src = "./src/counter.v:17" *)
  output [3:0] Q;
  (* src = "./src/counter.v:18" *)
  output RCO;
  (* src = "./src/counter.v:13" *)
  input RESET;
  (* src = "./src/counter.v:13" *)
  input clk;
  NOT _078_ (
    .A(ENABLE),
    .Y(_004_)
  );
  NOT _079_ (
    .A(MODO[0]),
    .Y(_005_)
  );
  NOT _080_ (
    .A(MODO[1]),
    .Y(_006_)
  );
  NOR _081_ (
    .A(_006_),
    .B(_005_),
    .Y(_007_)
  );
  NOR _082_ (
    .A(_007_),
    .B(_004_),
    .Y(_008_)
  );
  NOT _083_ (
    .A(RESET),
    .Y(_009_)
  );
  NOT _084_ (
    .A(LOAD),
    .Y(_010_)
  );
  NAND _085_ (
    .A(_004_),
    .B(_010_),
    .Y(_011_)
  );
  NAND _086_ (
    .A(_011_),
    .B(_009_),
    .Y(_012_)
  );
  NOR _087_ (
    .A(_012_),
    .B(_008_),
    .Y(_000_)
  );
  NOT _088_ (
    .A(Q[0]),
    .Y(_013_)
  );
  NOT _089_ (
    .A(Q[1]),
    .Y(_014_)
  );
  NAND _090_ (
    .A(_014_),
    .B(_013_),
    .Y(_015_)
  );
  NOR _091_ (
    .A(_015_),
    .B(Q[2]),
    .Y(_016_)
  );
  NAND _092_ (
    .A(_006_),
    .B(MODO[0]),
    .Y(_017_)
  );
  NOR _093_ (
    .A(_017_),
    .B(Q[3]),
    .Y(_018_)
  );
  NAND _094_ (
    .A(_018_),
    .B(_016_),
    .Y(_019_)
  );
  NAND _095_ (
    .A(_019_),
    .B(ENABLE),
    .Y(_020_)
  );
  NOR _096_ (
    .A(MODO[1]),
    .B(MODO[0]),
    .Y(_021_)
  );
  NOT _097_ (
    .A(Q[3]),
    .Y(_022_)
  );
  NAND _098_ (
    .A(_015_),
    .B(Q[2]),
    .Y(_023_)
  );
  NOR _099_ (
    .A(_023_),
    .B(_022_),
    .Y(_024_)
  );
  NAND _100_ (
    .A(_024_),
    .B(_021_),
    .Y(_025_)
  );
  NOR _101_ (
    .A(_006_),
    .B(MODO[0]),
    .Y(_026_)
  );
  NOT _102_ (
    .A(Q[2]),
    .Y(_027_)
  );
  NAND _103_ (
    .A(Q[1]),
    .B(Q[0]),
    .Y(_028_)
  );
  NOR _104_ (
    .A(_028_),
    .B(_027_),
    .Y(_029_)
  );
  NAND _105_ (
    .A(_029_),
    .B(_026_),
    .Y(_030_)
  );
  NOT _106_ (
    .A(_030_),
    .Y(_031_)
  );
  NAND _107_ (
    .A(_031_),
    .B(Q[3]),
    .Y(_032_)
  );
  NAND _108_ (
    .A(_032_),
    .B(_025_),
    .Y(_033_)
  );
  NOR _109_ (
    .A(_033_),
    .B(_020_),
    .Y(_034_)
  );
  NOT _110_ (
    .A(RCO),
    .Y(_035_)
  );
  NAND _111_ (
    .A(_035_),
    .B(_004_),
    .Y(_036_)
  );
  NAND _112_ (
    .A(_036_),
    .B(_009_),
    .Y(_037_)
  );
  NOR _113_ (
    .A(_037_),
    .B(_034_),
    .Y(_002_)
  );
  NOT _114_ (
    .A(_007_),
    .Y(_038_)
  );
  NOR _115_ (
    .A(_038_),
    .B(D[0]),
    .Y(_039_)
  );
  NOR _116_ (
    .A(RESET),
    .B(_004_),
    .Y(_040_)
  );
  NAND _117_ (
    .A(_038_),
    .B(Q[0]),
    .Y(_041_)
  );
  NAND _118_ (
    .A(_041_),
    .B(_040_),
    .Y(_042_)
  );
  NOR _119_ (
    .A(_042_),
    .B(_039_),
    .Y(_001_[0])
  );
  NOT _120_ (
    .A(_040_),
    .Y(_043_)
  );
  NOT _121_ (
    .A(_026_),
    .Y(_044_)
  );
  NAND _122_ (
    .A(_028_),
    .B(_015_),
    .Y(_045_)
  );
  NOR _123_ (
    .A(_045_),
    .B(_044_),
    .Y(_046_)
  );
  NAND _124_ (
    .A(_045_),
    .B(_006_),
    .Y(_047_)
  );
  NAND _125_ (
    .A(_007_),
    .B(D[1]),
    .Y(_048_)
  );
  NAND _126_ (
    .A(_048_),
    .B(_047_),
    .Y(_049_)
  );
  NOR _127_ (
    .A(_049_),
    .B(_046_),
    .Y(_050_)
  );
  NOR _128_ (
    .A(_050_),
    .B(_043_),
    .Y(_001_[1])
  );
  NAND _129_ (
    .A(_007_),
    .B(D[2]),
    .Y(_051_)
  );
  NAND _130_ (
    .A(_028_),
    .B(_027_),
    .Y(_052_)
  );
  NOR _131_ (
    .A(_029_),
    .B(_044_),
    .Y(_053_)
  );
  NAND _132_ (
    .A(_053_),
    .B(_052_),
    .Y(_054_)
  );
  NAND _133_ (
    .A(_054_),
    .B(_051_),
    .Y(_055_)
  );
  NOR _134_ (
    .A(Q[1]),
    .B(Q[0]),
    .Y(_056_)
  );
  NOR _135_ (
    .A(_056_),
    .B(_027_),
    .Y(_057_)
  );
  NOR _136_ (
    .A(_016_),
    .B(_057_),
    .Y(_058_)
  );
  NAND _137_ (
    .A(_058_),
    .B(_021_),
    .Y(_059_)
  );
  NOR _138_ (
    .A(MODO[1]),
    .B(_005_),
    .Y(_060_)
  );
  NAND _139_ (
    .A(_056_),
    .B(_027_),
    .Y(_061_)
  );
  NAND _140_ (
    .A(_061_),
    .B(_023_),
    .Y(_062_)
  );
  NAND _141_ (
    .A(_062_),
    .B(_060_),
    .Y(_063_)
  );
  NAND _142_ (
    .A(_063_),
    .B(_059_),
    .Y(_064_)
  );
  NOR _143_ (
    .A(_064_),
    .B(_055_),
    .Y(_065_)
  );
  NOR _144_ (
    .A(_065_),
    .B(_043_),
    .Y(_001_[2])
  );
  NOR _145_ (
    .A(_017_),
    .B(_016_),
    .Y(_066_)
  );
  NOR _146_ (
    .A(_066_),
    .B(_053_),
    .Y(_067_)
  );
  NOR _147_ (
    .A(_067_),
    .B(_022_),
    .Y(_068_)
  );
  NAND _148_ (
    .A(_023_),
    .B(_022_),
    .Y(_069_)
  );
  NOT _149_ (
    .A(_021_),
    .Y(_070_)
  );
  NOR _150_ (
    .A(_024_),
    .B(_070_),
    .Y(_071_)
  );
  NAND _151_ (
    .A(_071_),
    .B(_069_),
    .Y(_072_)
  );
  NOR _152_ (
    .A(_030_),
    .B(Q[3]),
    .Y(_073_)
  );
  NAND _153_ (
    .A(_007_),
    .B(D[3]),
    .Y(_074_)
  );
  NAND _154_ (
    .A(_074_),
    .B(_019_),
    .Y(_075_)
  );
  NOR _155_ (
    .A(_075_),
    .B(_073_),
    .Y(_076_)
  );
  NAND _156_ (
    .A(_076_),
    .B(_072_),
    .Y(_077_)
  );
  NOR _157_ (
    .A(_077_),
    .B(_068_),
    .Y(_003_)
  );
  NOR _158_ (
    .A(_003_),
    .B(_043_),
    .Y(_001_[3])
  );
  DFF _159_ (
    .C(clk),
    .D(_001_[0]),
    .Q(Q[0])
  );
  DFF _160_ (
    .C(clk),
    .D(_001_[1]),
    .Q(Q[1])
  );
  DFF _161_ (
    .C(clk),
    .D(_001_[2]),
    .Q(Q[2])
  );
  DFF _162_ (
    .C(clk),
    .D(_001_[3]),
    .Q(Q[3])
  );
  DFF _163_ (
    .C(clk),
    .D(_002_),
    .Q(RCO)
  );
  DFF _164_ (
    .C(clk),
    .D(_000_),
    .Q(LOAD)
  );
  assign MODO_reg = MODO;
endmodule