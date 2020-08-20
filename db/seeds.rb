dwayne = User.create(email: "dwayne@me.com", name: "Dwayne", password: "password")
billy = User.create(email: "billy@bob.com", name: "William", password: "notpassword")
bob = User.create(email: "bob@billy.com", name: "Robert", password: "callmebob")

power = Movie.create_from_scrape("https://www.imdb.com/title/tt7550000/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=ea4e08e1-c8a3-47b5-ac3a-75026647c16e&pf_rd_r=GFFZFMD0JVVYSX59QTG8&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=moviemeter&ref_=chtmvm_tt_1")
max = Movie.create_from_scrape("https://www.imdb.com/title/tt0079501/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=ea4e08e1-c8a3-47b5-ac3a-75026647c16e&pf_rd_r=GFFZFMD0JVVYSX59QTG8&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=moviemeter&ref_=chtmvm_tt_93")
matrix = Movie.create_from_scrape("https://www.imdb.com/title/tt0133093/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=ea4e08e1-c8a3-47b5-ac3a-75026647c16e&pf_rd_r=GFFZFMD0JVVYSX59QTG8&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=moviemeter&ref_=chtmvm_tt_98")
