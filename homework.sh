#!/bin/bash
confirm_function(){
while true; do
	clear
	echo -n"You have chosen to purchase a package
	To confirm press 1,to cancel press another key.
	**.Main menu"
	read answer
	[[ "$answer" == "**" ]] && return 1

	case $answer in
		"1")
		clear
		echo "Dear customer,your order is successfully submitted.You will get SMS notification shortly for confirmation.ethio telecom."
		read answer
		exit;;
		
		*)
		clear
		echo "You have cancelled the package subscription.Please try again.Thank you"
		read answer
		exit;;
	esac
done
}
number_input(){
	while true;do
    clear
    echo -n"Please enter the number
    **Main Menu"
    read number
    [[ -n $number ]] && break 
  done
	
	[[ "$number" == "**" ]] && return 1
	return 0;
	
	
}
gift_confirm_function(){
	number_input || return 1
	clear
	case $number in
	[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])
		echo -n"You have entered $number
		1.Continue
		2.Change
		**.Main Menu"
		read gift_confirm
    [[ "$gift_confirm" == "**" ]] && return 1
		case $gift_confirm in 
			"1")
			if [[ "$number" == 09* ]]; then
				confirm_function
        if [ $? -eq 1 ]; then
          return
        fi 
			else
				echo "Sorry operation failed, please try again later"
				exit
			fi;;
			"2")
			  gift_confirm_function
        if [ $? -eq 1 ]; then
          return
        fi
        ;;
			"**")
			return;;
			*) 
			echo "Connection problem or invalid MMI code";;			
		esac;;
	
	"**")
		return ;;
	???????????*)
		gift_confirm_function
    if [ $? -eq 1 ]; then
      return
    fi 
    ;;
	*)
		echo "Connection problem or invalid MMI code";;
	esac
	
}
self_monthly_frequency(){
  while true; do
  clear
  echo -n"Please select:
  1.One Time Only
  2.Recurring Monthly
  **.Main Menu"
  read monthly_choice
  [[ "$monthly_choice" == "**" ]] && return 1
  case $monthly_choice in
    "1")
    clear
    confirm_function
    if [ $? -eq 1 ]; then
      return 1
    fi
    ;;
    "2")
      clear
	    echo -n"You have chosen to purchase a recurring package
        To confirm press 1,to cancel press another key.
        **.Main menu"
        read answer
        [[ "$answer" == "**" ]] && return 1

        case $answer in
          "1")
          clear
          echo "Dear customer,your order is successfully submitted.You will get SMS notification shortly for confirmation.ethio telecom."
          read answer
          exit;;
          
          *)
          clear
          echo "You have cancelled the package subscription.Please try again.Thank you"
          read answer
          exit;;
        esac;;
    *)
    echo "Connection problem or invalid MMI code";;

  esac
  done
  return 0
}

internet_menu(){
while true; do
    clear
    echo -n"Internet Package
1.For self
2.For gift
**.Main Menu"
    read target_choice

    case $target_choice in
      "1"|"2")
	while true; do
        	clear
        	echo -n"Internet Package
		1.Daily
		2.Weekly
		3.Monthly
		4.No Expiry Date
		*.Back
		**.Main Menu"

		read reply_internet

		case $reply_internet in
			"1")
			clear
			echo -n"Daily
			1.Br.5 for 100MB
			2.Br.10 for 200MB
			3.Br.15 for 300MB
			4.Br.25 for 600MB
			*.Back
			**.Main menu"
			read reply_daily
			case $reply_daily in
				"1"|"2"|"3"|"4")
				if [ "$target_choice" == "1" ]; then
					confirm_function
          if [ $? -eq 1 ]; then
            return
          fi 

				elif [ "$target_choice" == "2" ]; then
					gift_confirm_function
          if [ $? -eq 1 ]; then
            return
          fi
				fi;;
       		"*") 
				;;
				#nothing happens,let it stay in the daily,weekly.. while loops 
          "**") 
				return ;;       
			esac;;

			"2")
			clear
			echo -n"Weekly
		1.Br.50 for 650MB
		2.Br.70 for 1GB
		3.Br.140 for 2.5GB
		4.Br.200 for 4GB
		*.Back
		**.Main menu"
		read reply_weekly
		case $reply_weekly in
			"1"|"2"|"3"|"4")
			if [ "$target_choice" == "1" ]; then
				confirm_function
        if [ $? -eq 1 ]; then
          return
        fi 

			elif [ "$target_choice" == "2" ]; then
				gift_confirm_function
        if [ $? -eq 1 ]; then
          return
        fi
			fi;;
      "*") 
				;; 
      "**") 
			return ;; 
			*) 
			echo "Connection problem or invalid MMI code";; 
     
		esac;;
			"3")
			clear
			echo -n"Monthly
			1.Birr 82 for 1GB
			2.Birr 150 for 2GB
			3.Birr 280 for 4GB
			4.Birr 550 for 10GB
			*.Back
			**.Main Menu"
			read reply_monthly
			case $reply_monthly in
			"1"|"2"|"3"|"4")
			if [ "$target_choice" == "1" ]; then
        self_monthly_frequency
        if [ $? -eq 1 ]; then
          return
        fi 
			elif [ "$target_choice" == "2" ]; then
				gift_confirm_function
        if [ $? -eq 1 ]; then
          return
        fi 
			fi;;
			"*")
			;;
			"**")
			return;;
			*) 
			echo "Connection problem or invalid MMI code";; 
			esac;;
	
			"4")
			echo -n"No expiry date package
				1.Br. 90 for 1GB
				2.Br. 165 for 2GB
				3.Br. 220 for 2GB+100Min
				4.Br. 1100 for 20GB
				*.Back"
				read no_expiry
			case $no_expiry in
			"1"|"2"|"3"|"4")
			if [ "$target_choice" == "1" ]; then
				confirm_function
        if [ $? -eq 1 ]; then
          return
        fi 
			elif [ "$target_choice" == "2" ]; then
				gift_confirm_function
        if [ $? -eq 1 ]; then
          return
        fi 
			fi;;
			"*")
			;;
			"**")
			return;;
			*) 
			echo "Connection problem or invalid MMI code";; 
			esac
			;;
			"*")
			break;;
	
			"**") 
			return ;;
			*) 
			echo "Connection problem or invalid MMI code";; 
		esac  
	done;;
	"**") 
	    return ;;
    *) 
	echo "Connection problem or invalid MMI code" ;;
    esac        
  done 

}

voice_menu(){
  while true; do
    clear
    echo -n"Voice package
    1.For self
    2.For gift
    **.Main menu"
    read target_choice

    case $target_choice in
      "1"|"2")
      while true; do
        clear
        echo -n"Voice package
        1.Daily
        2.Weekly
        3.Monthly
        4.No expiry date package
        *.Back
        **.Main menu"
        read sub_reply
        case $sub_reply in
        "*") 
        break;;
        "**") 
        return ;;
      1)
        clear
        echo -n"1.Birr 5 for 20 Min+10 Min Night bonus
        2.Birr 10 for 42 Min+21 Min Night bonus
        3.Birr 15 for 65 Min+33 Min Night bonus
        4.Birr 20 for 88 Min+44 Min Night bonus
        *.Back"
        read daily_choice
        case $daily_choice in
          "1"|"2"|"3"|"4")
          if [ "$target_choice" == "1" ]; then
            confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          elif [ "$target_choice" == "2" ]; then
            gift_confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          fi;;
          "*")
          ;;
          "**")
          return;;
          *) 
          echo "Connection problem or invalid MMI code";;
        esac
        ;;
      2)
        clear
        echo -n"Weely
        1.Birr 25 for 70 Min+35 Min Night bonus
        2.Birr 35 for 110 Min+55 Min Night bonus
        3.Birr 45 for 145 Min+73 Min Night bonus
        *.Back
        **.Main Menu"
        read weekly_choice
        case $weekly_choice in
          "1"|"2"|"3"|"4")
          if [ "$target_choice" == "1" ]; then
            confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          elif [ "$target_choice" == "2" ]; then
            gift_confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          fi;;
          "*")
          ;;
          "**")
          return;;
          *) 
          echo "Connection problem or invalid MMI code";;
        esac
        ;;
      3)
      echo -n"Monthly
      1.Birr 50 for 125 Min+63 Min Night bonus
      2.Birr 75 for 190 Min+95 Min Night bonus
      3.Birr 100 for 270 Min+135 Min Night bonus
      #.Next page"
      read monthly_choice
        case $monthly_choice in
          "1"|"2"|"3"|"4")
          if [ "$target_choice" == "1" ]; then
            self_monthly_frequency
            if [ $? -eq 1 ]; then
              return
            fi 
          elif [ "$target_choice" == "2" ]; then
            gift_confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          fi;;
          "*")
          ;;
          "**")
          return;;
          "#")
          echo -n"yet to be implemented";;
          *) 
          echo "Connection problem or invalid MMI code";;
        esac
        ;;
        4)
        echo -n"No expiry date package
        1.Br. 125 for 300 Min
        *.Back"
        read no_expiry_choice
        case $no_expiry_choice in
          "1"|"2"|"3"|"4")
          if [ "$target_choice" == "1" ]; then
            confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          elif [ "$target_choice" == "2" ]; then
            gift_confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          fi;;
          "*")
          ;;
          "**")
          return;;
          *) 
          echo "Connection problem or invalid MMI code";;
        esac
        ;;
      esac
    done;;
    "**") return ;;
    *)
		echo "Connection problem or invalid MMI code";;
    
    esac
  done
}
social_media_menu(){
  clear
  while true; do
  clear
  echo -n"Social Media package
    1.For self
    2.For gift
    **.Main Menu"
  read target_choice
  if [ "$target_choice" == "1" ]; then
    target_var="For yourself"
  elif [ "$target_choice" == "2" ]; then
    target_var="For gift"
  fi
 
  case $target_choice in 
    "1"|"2")
     while true; do
      clear
      echo -n"$target_var
        1.Daily
        2.Weekly
        3.Monthly
        *.Back
        **.Main Menu"
      read reply_social
      case $reply_social in
      "1")
        clear
        echo -n"Daily
        1.Br. 20 for 1.25 GB Telegram + Whatsapp
        2.Br. 39 for 2 GB Facebook + YouTube + Tiktok
        *.Back
        **.Main Menu"
        read social_daily
        case $social_daily in
        "1"|"2")
          if [ "$target_choice" == "1" ]; then
            confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          elif [ "$target_choice" == "2" ]; then
            gift_confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          fi;;
          "*")
          ;;
          
          "**")
          return;;
          *) 
          echo "Connection problem or invalid MMI code";;
        esac;;
      "2")
        clear
        echo -n"Weekly
        1.Br.80 for 3 GB Telegram + Whatsapp
        2.Br.100 for 4 GB Facebook + YouTube + Tiktok
        *.Back
        **.Main Menu"
        read social_weekly
        case $social_weekly in
        "1"|"2")
          if [ "$target_choice" == "1" ]; then
            confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          elif [ "$target_choice" == "2" ]; then
            gift_confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          fi;;
          "*")
          ;;
          "**")
          return;;
          *) 
          echo "Connection problem or invalid MMI code";;
        esac;;

      "3")
        clear
        echo -n"Monthly
        1.Br.110 for 4 GB Telegram + WhatsApp
        2.Br.300 for 10 GB Facebook + YouTube +Tiktok
        *.Back
        **.Main Menu"
        read social_monthly
        case $social_monthly in
        "1"|"2")
          if [ "$target_choice" == "1" ]; then
            self_monthly_frequency
            if [ $? -eq 1 ]; then
              return
            fi 
          elif [ "$target_choice" == "2" ]; then
            gift_confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          fi;;
          "*")
        	;;
          "**")
          return;;
          *) 
          echo "Connection problem or invalid MMI code";;
        esac;;
      "*")
      break;;
      "**")
      return;;
      *)
      clear
      echo "Connection problem or invalid MMI code";;
      esac
      done
    esac
  
done
}
voice_plus_data_menu(){
	clear
	while true; do
	echo -n"Voice Plus Internet
	1.For self
	2.For gift
	*.Back
	**.Main Menu"
	read target_choice
  if [ "$target_choice" == "1" ]; then
    target_var="For yourself"
  elif [ "$target_choice" == "2" ]; then
    target_var="For gift"
  fi
	case $target_choice in
   "1"|"2")
   while true; do
   clear
    echo -n"$target_var
    1.Daily
    2.Weekly
    3.Monthly
    *.Back
    **.Main Menu"
    read voice_data_choice
    case $voice_data_choice in
    "1")
    clear
    echo -n"Daily
    1.Birr 15 for 20Min+200MB
    2.Birr 25 for 30Min+420MB
    3.Birr 45 for 50Min+850MB
    *.Back
    **.Main Menu"
    read voice_data_daily
    case $voice_data_daily in
      "1"|"2"|"3")
        if [ "$target_choice" == "1" ]; then
          confirm_function
          if [ $? -eq 1 ]; then
            return
          fi 
        elif [ "$target_choice" == "2" ]; then
          gift_confirm_function
          if [ $? -eq 1 ]; then
            return
          fi 
        fi;;
        "*")
        break;;
        "**")
        return;;
        *) 
        echo "Connection problem or invalid MMI code";;

    esac;;
    "2")
    clear
    echo -n"Weekly
    1.Birr 70 for 80Min, 520MB
    2.Birr 85 for 135Min, 600MB
    3.Birr 135 for 250Min, 1GB
    *.Back
    **.Main Menu"
    read voice_data_weekly
    case $voice_data_weekly in
      "1"|"2"|"3")
        if [ "$target_choice" == "1" ]; then
          confirm_function
          if [ $? -eq 1 ]; then
            return
          fi 
        elif [ "$target_choice" == "2" ]; then
          gift_confirm_function
          if [ $? -eq 1 ]; then
            return
          fi 
        fi;;
        "*")
        break;;
        
        "**")
        return;;
        *) 
        echo "Connection problem or invalid MMI code";;
    esac;;
    "3")
    clear
    echo -n"Monthly
    1.Br 130 for 140Min+1GB
    2.Birr 170 for 275Min+1GB
    3.Birr 225 for 480Min+1GB
    4.Birr 400 for 430Min+4GB
    5.Birr 1345 for 1000Min+25GB
    #.Next Page"
    read voice_data_monthly
    case $voice_data_monthly in
      "1"|"2"|"3"|"4"|"5"|"6")
          if [ "$target_choice" == "1" ]; then
            self_monthly_frequency
            if [ $? -eq 1 ]; then
              return
            fi 
          elif [ "$target_choice" == "2" ]; then
            gift_confirm_function
            if [ $? -eq 1 ]; then
              return
            fi 
          fi;;
          "#")
          clear
          echo -n"6.Birr 2050 for 1000Min + Unlimited Data
          *.Back
          **.Main Menu
          ##.Previous page"
          read voice_data_monthly;;
          # case $voice_data_monthly in
          # esac
          "*")
          break;;
          
          "**")
          return;;
          *) 
          echo "Connection problem or invalid MMI code";;
    esac;;
    "*")
    break;;
    "**")
    return;;
    *)
    echo "Connection problem or invalid MMI code";;
    esac
    done
	esac
done
}
unlimited_menu(){
  while true; do
    clear
    echo -n"Package
    1.For self
    2.For gift
    *.Back"
    read target_choice
    if [[ "$target_choice" == "1"]]; then
      target_var="For self"
    elif [[ "$target_choice" == "2" ]]; then
      target_var="For gift"
    fi
    case $target_choice in
      "1"|"2")
      echo -n"For self
        1.Hourly/Daily
        2.Weekly
        3.Monthly
        4.Long Validity
        *.Back
        **.Main Menu"


      "

    esac
    done

}
# --- Main Menu Loop --
while true; do
  clear
  echo -n"Welcome to ethio gebeta package
1.Internet
2.Voice
3.Social Media
4.Voice Plus Data
5.Unlimited
#.Next Page"
  read reply_main

  case $reply_main in
    "1") internet_menu ;;
    "2") voice_menu ;;
    "3") social_media_menu;;
    "4") voice_plus_data_menu;;
    "5") unlimited_menu;;
	  *) echo "Connection problem or invalid MMI code";;
  esac
done
