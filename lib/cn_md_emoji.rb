#encoding: utf-8
require 'redcarpet'

require 'cn_md_emoji/engine'
require 'cn_md_emoji/render'
require 'cn_md_emoji/version'

module CnMdEmoji  
  EMOJI = %w{+1 -1 0 1 100 109 1234 2 3 4 5 6 7 8 8ball 9 a ab
  abc abcd accept aerial_tramway airplane alarm_clock alien ambulance 
  anchor angel anger angry anguished ant apple aquarius aries arrow_backward 
  arrow_double_down arrow_double_up arrow_down arrow_down_small arrow_forward 
  arrow_heading_down arrow_heading_up arrow_left arrow_lower_left arrow_lower_right 
  arrow_right arrow_right_hook arrow_up arrow_up_down arrow_up_small arrow_upper_left 
  arrow_upper_right arrows_clockwise arrows_counterclockwise art articulated_lorry 
  astonished atm b baby baby_bottle baby_chick baby_symbol baggage_claim balloon 
  ballot_box_with_check bamboo banana bangbang bank bar_chart barber baseball 
  basketball bath bathtub battery bear beer beers beetle beginner bell bento 
  bicyclist bike bikini bird birthday black_circle black_joker black_nib black_square 
  black_square_button blossom blowfish blue_book blue_car blue_heart blush boar 
  boat bomb book bookmark bookmark_tabs books boom boot bouquet bow bowling bowtie 
  boy bread bride_with_veil bridge_at_night briefcase broken_heart bug bulb bullettrain_front 
  bullettrain_side bus busstop bust_in_silhouette busts_in_silhouette cactus cake calendar 
  calling camel camera cancer candy capital_abcd capricorn car card_index carousel_horse 
  cat cat2 cd chart chart_with_downwards_trend chart_with_upwards_trend checkered_flag 
  cherries cherry_blossom chestnut chicken children_crossing chocolate_bar christmas_tree 
  church cinema circus_tent city_sunrise city_sunset cl clap clapper clipboard clock1 clock10 
  clock1030 clock11 clock1130 clock12 clock1230 clock130 clock2 clock230 clock3 clock330 
  clock4 clock430 clock5 clock530 clock6 clock630 clock7 clock730 clock8 clock830 clock9 
  clock930 closed_book closed_lock_with_key closed_umbrella cloud clubs cn cocktail coffee 
  cold_sweat collision computer confetti_ball confounded confused congratulations construction 
  construction_worker convenience_store cookie cool cop copyright corn couple couple_with_heart 
  couplekiss cow cow2 credit_card crocodile crossed_flags crown cry crying_cat_face crystal_ball 
  cupid curly_loop currency_exchange curry custard customs cyclone dancer dancers dango dart dash 
  date de deciduous_tree department_store diamond_shape_with_a_dot_inside diamonds disappointed 
  disappointed_relieved dizzy dizzy_face do_not_litter dog dog2 dollar dolls dolphin door doughnut 
  dragon dragon_face dress dromedary_camel droplet dvd e-mail ear ear_of_rice earth_africa 
  earth_americas earth_asia egg eggplant egplant eight eight_pointed_black_star eight_spoked_asterisk 
  electric_plug elephant email end envelope es euro european_castle european_post_office 
  evergreen_tree exclamation expressionless eyeglasses eyes facepunch factory fallen_leaf family 
  fast_forward fax fearful feelsgood feet ferris_wheel file_folder finnadie fire fire_engine 
  fireworks first_quarter_moon first_quarter_moon_with_face fish fish_cake 
  fishing_pole_and_fish fist five flags flashlight floppy_disk flower_playing_cards 
  flushed foggy football fork_and_knife fountain four four_leaf_clover fr free fried_shrimp 
  fries frog frowning fu fuelpump full_moon full_moon_with_face game_die gb gem gemini ghost 
  gift gift_heart girl globe_with_meridians goat goberserk godmode golf grapes green_apple 
  green_book green_heart grey_exclamation grey_question grimacing grin grinning guardsman 
  guitar gun haircut hamburger hammer hamster hand handbag hankey hash hatched_chick hatching_chick 
  headphones hear_no_evil heart heart_decoration heart_eyes heart_eyes_cat heartbeat heartpulse 
  hearts heavy_check_mark heavy_division_sign heavy_dollar_sign heavy_exclamation_mark 
  heavy_minus_sign heavy_multiplication_x heavy_plus_sign helicopter herb hibiscus high_brightness 
  high_heel hocho honey_pot honeybee horse horse_racing hospital hotel hotsprings hourglass 
  hourglass_flowing_sand house house_with_garden hurtrealbad hushed ice_cream icecream id ideograph_advantage imp 
  inbox_tray incoming_envelope information_desk_person information_source innocent interrobang 
  iphone it izakaya_lantern jack_o_lantern japan japanese_castle japanese_goblin japanese_ogre 
  jeans joy joy_cat jp key keycap_ten kimono kiss kissing kissing_cat kissing_closed_eyes kissing_face 
  kissing_heart kissing_smiling_eyes koala koko kr large_blue_circle large_blue_diamond 
  large_orange_diamond last_quarter_moon last_quarter_moon_with_face laughing leaves ledger 
  left_luggage left_right_arrow leftwards_arrow_with_hook lemon leo leopard libra light_rail 
  link lips lipstick lock lock_with_ink_pen lollipop loop loudspeaker love_hotel love_letter 
  low_brightness m mag mag_right mahjong mailbox mailbox_closed mailbox_with_mail mailbox_with_no_mail 
  man man_with_gua_pi_mao man_with_turban mans_shoe maple_leaf mask massage meat_on_bone mega melon 
  memo mens metal metro microphone microscope milky_way minibus minidisc mobile_phone_off money_with_wings 
  moneybag monkey monkey_face monorail moon mortar_board mount_fuji mountain_bicyclist mountain_cableway 
  mountain_railway mouse mouse2 movie_camera moyai muscle mushroom musical_keyboard musical_note 
  musical_score mute nail_care name_badge neckbeard necktie negative_squared_cross_mark neutral_face 
  new new_moon new_moon_with_face newspaper ng nine no_bell no_bicycles no_entry no_entry_sign no_good 
  no_mobile_phones no_mouth no_pedestrians no_smoking non-potable_water nose notebook 
  notebook_with_decorative_cover notes nut_and_bolt o o2 ocean octocat octopus oden office ok ok_hand 
  ok_woman older_man older_woman on oncoming_automobile oncoming_bus oncoming_police_car oncoming_taxi 
  one open_file_folder open_hands open_mouth ophiuchus orange_book outbox_tray ox page_facing_up 
  page_with_curl pager palm_tree panda_face paperclip parking part_alternation_mark partly_sunny 
  passport_control paw_prints peach pear pencil pencil2 penguin pensive performing_arts persevere 
  person_frowning person_with_blond_hair person_with_pouting_face phone pig pig2 pig_nose pill 
  pineapple pisces pizza plus1 point_down point_left point_right point_up point_up_2 police_car 
  poodle poop post_office postal_horn postbox potable_water pouch poultry_leg pound pouting_cat 
  pray princess punch purple_heart purse pushpin put_litter_in_its_place question rabbit rabbit2 
  racehorse radio radio_button rage rage1 rage2 rage3 rage4 railway_car rainbow raised_hand raised_hands 
  raising_hand ram ramen rat recycle red_car red_circle registered relaxed relieved repeat repeat_one 
  restroom revolving_hearts rewind ribbon rice rice_ball rice_cracker rice_scene ring rocket 
  roller_coaster rooster rose rotating_light round_pushpin rowboat ru rugby_football runner running 
  running_shirt_with_sash sa sagittarius sailboat sake sandal santa satellite satisfied saxophone 
  school school_satchel scissors scorpius scream scream_cat scroll seat secret see_no_evil 
  seedling seven shaved_ice sheep shell ship shipit shirt shit shoe shower signal_strength six 
  six_pointed_star ski skull sleeping sleepy slot_machine small_blue_diamond small_orange_diamond 
  small_red_triangle small_red_triangle_down smile smile_cat smiley smiley_cat smiling_imp smirk 
  smirk_cat smoking snail snake snowboarder snowflake snowman sob soccer soon sos sound space_invader 
  spades spaghetti sparkler sparkles sparkling_heart speak_no_evil speaker speech_balloon speedboat 
  squirrel star star2 stars station statue_of_liberty steam_locomotive stew straight_ruler strawberry 
  stuck_out_tongue stuck_out_tongue_closed_eyes stuck_out_tongue_winking_eye sun_with_face sunflower 
  sunglasses sunny sunrise sunrise_over_mountains surfer sushi suspect suspension_railway sweat 
  sweat_drops sweat_smile sweet_potato swimmer symbols syringe tada tanabata_tree tangerine taurus 
  taxi tea telephone telephone_receiver telescope tennis tent thought_balloon three thumbsdown 
  thumbsup ticket tiger tiger2 tired_face tm toilet tokyo_tower tomato tongue tongue2 top tophat 
  tractor traffic_light train train2 tram triangular_flag_on_post triangular_ruler trident triumph 
  trolleybus trollface trophy tropical_drink tropical_fish truck trumpet tshirt tulip turtle tv 
  twisted_rightwards_arrows two two_hearts two_men_holding_hands two_women_holding_hands 
  u5272 u5408 u55b6 u6307 u6708 u6709 u6e80 u7121 u7533 u7981 u7a7a uk umbrella unamused 
  underage unlock up us v vertical_traffic_light vhs vibration_mode video_camera video_game 
  violin virgo volcano vs walking waning_crescent_moon waning_gibbous_moon warning watch 
  water_buffalo watermelon wave wavy_dash waxing_crescent_moon waxing_gibbous_moon wc weary 
  wedding whale whale2 wheelchair white_check_mark white_circle white_flower white_square 
  white_square_button wind_chime wine_glass wink wink2 wolf woman womans_clothes womans_hat 
  womens worried wrench x yellow_heart yen yum zap zero zzz}

  CN_MOJI=["呵呵", "嘻嘻", "哈哈", "爱你", "晕", "泪", "馋嘴", "抓狂", "哼", "可爱", "怒", "汗", "困", "害羞", "睡觉", "钱", "偷笑", "酷", "衰", "吃惊", "闭嘴", "鄙视", "挖鼻屎", "花心", "鼓掌", "失望", "思考", "生病", "亲亲", "怒骂", "太开心", "懒得理你", "右哼哼", "左哼哼", "嘘", "委屈", "吐", "可怜", "打哈气", "做鬼脸", "握手", "耶", "good", "弱", "不要", "ok", "赞", "来", "蛋糕", "心", "伤心", "钟", "猪头", "咖啡", "话筒", "干杯", "绿丝带", "蜡烛", "微风", "月亮"]

  CN_EN = {"呵呵"=>"smile", "嘻嘻"=>"tooth", "哈哈"=>"laugh", "爱你"=>"love", "晕"=>"dizzy", "泪"=>"sad", "馋嘴"=>"cz_thumb", "抓狂"=>"crazy", "哼"=>"hate", "可爱"=>"tz_thumb", "怒"=>"angry", "汗"=>"sweat", "困"=>"sleepy", "害羞"=>"shame_thumb", "睡觉"=>"sleep_thumb", "钱"=>"money_thumb", "偷笑"=>"hei_thumb", "酷"=>"cool_thumb", "衰"=>"cry", "吃惊"=>"cj_thumb", "闭嘴"=>"bz_thumb", "鄙视"=>"bs2_thumb", "挖鼻屎"=>"kbs_thumb", "花心"=>"hs_thumb", "鼓掌"=>"gz_thumb", "失望"=>"sw_thumb", "思考"=>"sk_thumb", "生病"=>"sb_thumb", "亲亲"=>"qq_thumb", "怒骂"=>"nm_thumb", "太开心"=>"mb_thumb", "懒得理你"=>"ldln_thumb", "右哼哼"=>"yhh_thumb", "左哼哼"=>"zhh_thumb", "嘘"=>"x_thumb", "委屈"=>"wq_thumb", "吐"=>"t_thumb", "可怜"=>"kl_thumb", "打哈气"=>"k_thumb", "做鬼脸"=>"zgl_thumb", "握手"=>"ws_thumb", "耶"=>"ye_thumb", "good"=>"good_thumb", "弱"=>"sad_thumb", "不要"=>"no_thumb", "ok"=>"ok_thumb", "赞"=>"z2_thumb", "来"=>"come_thumb", "蛋糕"=>"cake", "心"=>"heart", "伤心"=>"unheart", "钟"=>"clock_thumb", "猪头"=>"pig", "咖啡"=>"cafe_thumb", "话筒"=>"m_thumb", "干杯"=>"cheer", "绿丝带"=>"green", "蜡烛"=>"candle", "微风"=>"wind_thumb", "月亮"=>"moon"}

  def self.emoji_html
    html = "<ul class='faceList inline'>"
    default_size = %{height="22" width="22"}
    CN_MOJI.each do |emoji|      
      html << %{<li title="#{emoji}"><a href="#"><img src="/assets/emojis/#{CN_EN[emoji]}.gif" class="emoji" } +
          %{ alt="#{emoji}" #{default_size}></a></li>}
    end
    html << "</ul>"
    html
  end
end
